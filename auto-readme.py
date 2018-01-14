import subprocess
import json
import requests

# Strongly recommend to get one github API-Key and place it on ./api_token.env
try:
    with open('api_token.env', 'r') as f:
        api_token = f.readline().strip()
        headers = {'Content-Type': 'application/json',
                   'Authorization': 'Bearer {0}'.format(api_token)}
except OSError:
    print("IO error")
    headers = {'Content-Type': 'application/json'}


categories = ["start", "opt"]
api_url_base = "https://api.github.com/repos"
api_url_end = "contents/pack"


def getGitInfo():
    """
    Return username and repository name of the current working directory git
    """
    git = subprocess.run(["git", "config", "--get", "remote.origin.url"],
                         stdout=subprocess.PIPE)
    gitInfo = git.stdout.decode("utf-8")
    gitInfo = gitInfo.rstrip("\n")
    infoList = gitInfo.split("/")
    repoName = infoList.pop()
    userName = infoList.pop()
    return userName, repoName


def getPackNames(api_url):
    """
    Return a list of Packs available at api_url
    """
    pack_list = []
    response = requests.get(api_url, headers=headers)
    if response.status_code == 200:
        for data in json.loads(response.content.decode('utf-8')):
            pack_list.append(data['name'])

        return pack_list
    else:
        return []


def getReposInfo(api_url):
    """
    Acquire repository informations from an api url
    """
    repos_list = []
    userName, repoName = getGitInfo()
    response = requests.get(api_url, headers=headers)
    if response.status_code == 200:
        for data in json.loads(response.content.decode('utf-8')):
            repo_name = data['name']
            repo_api_url = data['git_url'].split("/git/")[0]
            repo_response = requests.get(repo_api_url, headers=headers)
            repo_description = json.loads(
                repo_response.content.decode('utf-8'))['description']
            repo_clone_url = json.loads(
                repo_response.content.decode('utf-8'))['svn_url']
            repos_list.append({"name": repo_name,
                               "description": repo_description,
                               "url": repo_clone_url,
                               "api_url": repo_api_url})

        return repos_list
    else:
        return []


def copyReferenceReadme():
    """
    Copy the static part of readme to the new readme file
    """
    with open("README.md", "w") as readme:
        with open("README.static") as reference:
            for line in reference.readlines():
                readme.write(line)


copyReferenceReadme()
userName, repoName = getGitInfo()
pack_api_url = "{}/{}/{}/{}".format(api_url_base,
                                    userName, repoName,  api_url_end)
pack_names = getPackNames(pack_api_url)
with open("README.md", "a") as readme:
    for pack in pack_names:
        readme.write("### " + pack.title() + "\n")
        for category_name in categories:
            api_url = "{}/{}/{}/{}/{}/{}".format(api_url_base,
                                                 userName,
                                                 repoName,
                                                 api_url_end,
                                                 pack, category_name)
            repo_infos = getReposInfo(api_url)
            if(repo_infos):
                readme.write("#### " + category_name.title() + "\n")

            for repo in repo_infos:
                readme.write("##### [{}]({})\n".format(
                    repo['name'], repo['url']))
                readme.write(repo['description'] + "\n")

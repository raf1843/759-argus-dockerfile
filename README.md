# 759-argus-dockerfile

This fork of [ARGUS](https://github.com/purs3lab/Argus) was created as part of a course project for CSEC 759: Advanced Software Security Analysis.
Please see the [project report](report.md) for more information. 

## Usage

This Python script provides a command line interface for interacting with GitHub repositories and GitHub actions.

```bash
python argus.py --mode [mode] --url [url] [--output-folder path_to_output] [--config path_to_config] [--verbose] [--branch branch_name] [--commit commit_hash] [--tag tag_name] [--action-path path_to_action] [--workflow-path path_to_workflow]
```

### Parameters:

- `--mode`: The mode of operation. Choose either 'repo' or 'action'. This parameter is required.
- `--url`: The GitHub URL. Use `USERNAME:TOKEN@URL` for private repos. This parameter is required.
- `--output-folder`: The output folder. The default value is '/tmp'. This parameter is optional.
- `--config`: The config file. This parameter is optional.
- `--verbose`: Verbose mode. If this option is provided, the logging level is set to DEBUG. Otherwise, it is set to INFO. This parameter is optional.
- `--branch`: The branch name. You must provide exactly one of: `--branch`, `--commit`, `--tag`. This parameter is optional.
- `--commit`: The commit hash. You must provide exactly one of: `--branch`, `--commit`, `--tag`. This parameter is optional.
- `--tag`: The tag. You must provide exactly one of: `--branch`, `--commit`, `--tag`. This parameter is optional.
- `--action-path`: The (relative) path to the action. You cannot provide `--action-path` in repo mode. This parameter is optional.
- `--workflow-path`: The (relative) path to the workflow. You cannot provide `--workflow-path` in action mode. This parameter is optional.

### Modes

'repo' can be used to analyze the full workflow for a given repository. 'action' can be used to analyze a specific published action, given its repository.
Local actions and Docker Hub actions are not supported in 'repo' mode. 

Most relevant to this project, Docker actions are only fully supported using `--mode action` and `--url` leading to a Docker action repository ([like this](https://github.com/actions/hello-world-docker-action))

### Example:

To use this script to interact with a GitHub repo, you might run a command like the following:

```bash
python argus.py --mode repo --url https://github.com/username/repo.git --branch master
```

This would run the script in repo mode on the master branch of the specified repository.

### How to use

Argus can be run inside a docker container. To do so, follow the steps:
- Install docker and docker-compose
  - apt-get -y install docker.io docker-compose
- Clone the release branch of this repo
  - git clone <>
- Build the docker container
  - docker-compose build
- Now you can run argus. Example run:
  - docker-compose run argus --mode {mode} --url {url to target repo}
- Results will be available inside the `results` folder

## Viewing SARIF Results

You can view SARIF results either through an online viewer or with a Visual Studio Code (VSCode) extension.

1. **Online Viewer:** The [SARIF Web Viewer](https://microsoft.github.io/sarif-web-component/) is an online tool that allows you to visualize SARIF files. You can upload your SARIF file (`argus_report.sarif`) directly to the website to view the results.

2. **VSCode Extension:** If you prefer to use VSCode, you can install the [SARIF Viewer](https://marketplace.visualstudio.com/items?itemName=MS-SarifVSCode.sarif-viewer) extension. After installing the extension, you can open your SARIF file (`argus_report.sarif`) in VSCode. The results will appear in the SARIF Explorer pane, which provides a detailed and navigable view of the results.

Remember to handle the SARIF file with care, especially if it contains sensitive information from your codebase.

## Troubleshooting

If there is an issue with needing the Github authorization for running, you can provide `username:TOKEN` in the `GITHUB_CREDS` environment variable. This will be used for all the requests made to Github. Note, we do not store this information anywhere, neither create any thing in the Github account - we only use this for cloning the repositories.

## Contributions

Argus is an open-source project, and we welcome contributions from the community. Whether it's reporting a bug, suggesting a feature, or writing code, your contributions are always appreciated!

## Citation

```
  @inproceedings{muralee2023Argus,
    title={ARGUS: A Framework for Staged Static Taint Analysis of GitHub Workflows and Actions},
    author={S. Muralee, I. Koishybayev, A. Nahapetyan, G. Tystahl, B. Reaves, A. Bianchi, W. Enck, 
      A. Kapravelos, A. Machiry},
    booktitle={32st USENIX Security Symposium (USENIX Security 23)},
    year={2023},
  }
```

## License

Argus is licensed under GPL License.

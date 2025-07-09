# 🌀 Git & GitHub Notes

_A distributed version control system that helps track changes in files._

- Usually used for **code development**
- Allows multiple developers to **collaborate**, manage revisions, and keep a history of changes.

---

## 🧩 Git - Key Concepts

1. **Repository (repo):** Folder that stores project files and the full history of changes.
2. **Commit:** Snapshot of the changes made to files.
3. **Branch:** Separate line of development. Work on different features in different branches without affecting the main code.
4. **Merge:** Combining changes from one branch to another, usually to integrate features into the main project.
5. **Clone:** Copying a repository to your local machine.
6. **Pull:** Fetching & merging updates from remote to local.
7. **Push:** Sending changes from local repo to remote.
8. **Status:** Shows the state of working directory and staging area (which changes are staged, modified, or untracked).
9. **Diff:** Shows the differences between changes (what exactly added or removed).

---

## ☁️ GitHub - Web-based Platform

- Uses Git
- Hosts Git repositories in the cloud
- Makes **collaboration easier**
- Provides tools like:
  - Issue tracking
  - Pull request system
  - Project management features

---

## 🔑 GitHub Key Concepts

1. **Remote Repository:** Repository hosted on GitHub to share code & collaborate.
2. **Fork:** Copy of a repository you can work on. Common in open-source contributions.
3. **Pull Request (PR):** Request to merge changes from one branch (or fork) into another. Used for code review & collaboration.
4. **Issue:** Track bugs, enhancements, or tasks in a project.
5. **Collaborators:** People invited to work on a GitHub repository.
6. **GitHub Actions:** Automating workflows like builds/tests via customizable scripts.

---

## 🛠️ Basic Git Commands

```bash
git init                 # Initialize a new Git repository
git clone [url]          # Clone an existing repository
git status               # Check status of your working directory
git add [file]           # Stage a file for commit
git commit -m "message"  # Save changes
git push                 # Push changes to remote
git pull                 # Fetch & merge from remote

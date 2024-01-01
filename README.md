# git-filter-branch

### This repository converts LF to CRLF (for windows projects).

Run the following command:

    git filter-branch --force --tree-filter "powershell -encodedcommand RwBlAHQALQBDAGgAaQBsAGQASQB0AGUAbQAgAC0ARgBpAGwAZQAgAC0ARgBvAHIAYwBlACAALQBSAGUAYwB1AHIAcwBlACAAfAAgAHcAaABlAHIAZQAgAHsAJABfAC4AZQB4AHQAZQBuAHMAaQBvAG4AIAAtAGkAbgAgACcALgBhAGgAawAnACwAJwAuAGMAJwAsACcALgB0AHgAdAAnAH0AIAB8ACAADQAKACAAIAAgACAARgBvAHIARQBhAGMAaAAtAE8AYgBqAGUAYwB0ACAAewANAAoAIAAgACAAIAAgACAAIAAgACgAKABHAGUAdAAtAEMAbwBuAHQAZQBuAHQAIAAkAF8ALgBGAHUAbABsAE4AYQBtAGUAKQAgAC0AagBvAGkAbgAgACIAYAByAGAAbgAiACkAIAB8ACAAUwBlAHQALQBDAG8AbgB0AGUAbgB0ACAALQBOAG8ATgBlAHcAbABpAG4AZQAgACQAXwAuAEYAdQBsAGwATgBhAG0AZQANAAoAIAAgACAAIAB9AA==" --prune-empty --tag-name-filter cat -- --all

* `--force` This will override any previous saved filter-branch orginals. You can always use `git reflog` and `git reset --hard` to revisit your original `HEAD` so don't worry! (:
* `--tree-filter` Tells git that we want to make changes to the files in the directory.
* `powershell -encodedcommand` You'll want to look at command.ps1 for the details. Basically, it's changing LF (linefeed) to CRLF (carriage return linefeed)
* `--prune-empty` Tells git to drop any commits that become / are empty. Notably, any commits that change line endings will be removed.
* `--tag-name-filter cat` This should update the tags from the old branch to the new branch. I've had issues with this not updating the tags.
* `--` idk. 
* `--all` Means that this affects both tags and commits.

### Important Note

You'll want to push tags as well after running this command. To do so use:

    git push --force --all

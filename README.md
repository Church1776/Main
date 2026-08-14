# Main
Hub workspace from which I will centralize settings for working and attach other projects to and from.

## Localizing COnfigs
The files in this repository are intended to be modified according to the local machine/user profile paths that you use.

To make this easier, I provided the files but added their language related extension at the end to keep them versioned and to allow you to modify your own local needs without having to worry about affecting other instances of the Main Hub repository.

### Examples

For the main .code-workspace file, you can copy and paste the workspace.jsonc file, remove the extension, and then modify the folder paths you need opened.

The folder paths preset are really just my personal preferences for me, so you could fork this repo, modify the paths to what you want, and then just sync with my upstream if you want to have your own paths.

```zsh
cp main.code-workspace.jsonc  main.code-workspace
code main.code-workspace
```
```pwsh
Copy-Item ".clangd.yaml" ".clangd"
code ".clangd"
```

Modify the workspace how you want, paths and all.
If you think your modifications might be useful for others just add your changes to the workspace.jsonc file and submit a pull request.

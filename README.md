# Scripts

## Structure

```bash
  .
  ├── ...
  ├── bash_scripts
  │   ├── fade                # draws a cool colorful pattern in your terminal
  │   ├── gp                  # commits your git changes
  │
  ├── powershell
  │   ├── choco-install-apps  # auto installs all the desired apps from chocolatey    
  │
  └── ...
```

## Notes

### git bash on windows

To run bash scripts on your windows add bash scripts in  `C:\Users\<your user name>\bin` and you can run those scripts directly by calling them by there file name in git bash.

### powershell

run powershell scripts by `powershell -executionpolicy bypass -File <file location>`.

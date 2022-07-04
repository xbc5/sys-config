For `global` scripts: there are states for both the AppVM and TemplateVM. The state for the TemplateVM exports its `PATH` from the shell profile; the state for the AppVM will create a persistent directory in the AppVM.

For `local` script: a single state will suffice to export both the `PATH` and create a directory in the TemplateVM.

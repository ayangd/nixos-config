{ username, ... }:
{
  enable = true;
  settings = {
    gui = {
      # Mouse support (default: true)
      mouseEvents = true;

      # Warn before potentially destructive actions (default: false)
      skipAmendWarning = false;
      skipDiscardChangeWarning = false;
      skipStashWarning = false;

      # Side panel width as proportion of screen (default: 0.3333)
      sidePanelWidth = 0.3333;

      # How the main panel splits: flexible | horizontal | vertical (default: flexible)
      mainPanelSplitMode = "flexible";

      # Show files as tree structure rather than flat list (default: true)
      showFileTree = true;

      # Show command log panel at the bottom (default: true)
      showCommandLog = true;

      # Show divergence from base branch: none | onlyArrow | arrowAndNumber (default: none)
      showDivergenceFromBaseBranch = "none";

      # Use hunk-based selection in staging view, false = line-by-line (default: true)
      useHunkModeInStagingView = false;

      # Filter mode: substring | fuzzy (default: substring)
      filterMode = "fuzzy";

      # Status panel view: dashboard | allBranchesLog (default: dashboard)
      statusPanelView = "dashboard";
    };

    git = {
      pagers = [
        {
          colorArg = "always";
          # pager = "delta --dark --paging=never";
          # externalDiffCommand = "difft --color=always --display=inline";
        }
      ];

      commit = {
        # Add Signed-off-by trailer to commits (default: false)
        signOff = false;
        # Auto-wrap commit messages (default: true)
        autoWrapCommitMessage = true;
        # Wrap width for commit messages (default: 72)
        autoWrapWidth = 72;
      };

      # Automatically fetch from remotes in the background (default: true)
      autoFetch = true;
      # Automatically refresh UI when files change (default: true)
      autoRefresh = true;
      # Fetch all remotes vs only current (default: true)
      fetchAll = true;

      # Auto-forward branches after fetch: none | onlyMainBranches | allBranches (default: onlyMainBranches)
      autoForwardBranches = "none";

      # Automatically stage files when merge conflicts are resolved (default: true)
      autoStageResolvedConflicts = false;

      # Prevent force pushing entirely (default: false)
      disableForcePushing = false;

      # Number of context lines in diffs (default: 3)
      diffContextSize = 3;

      # Branch sort order: recency | date | alphabetical (default: date)
      localBranchSortOrder = "recency";
      remoteBranchSortOrder = "date";

      log = {
        # Log order: topo-order | date-order | author-date-order (default: topo-order)
        order = "topo-order";
        # Show graph: always | never | when-maximised (default: always)
        showGraph = "always";
      };
    };

    # How to check for updates: prompt | background | never (default: prompt)
    update.method = "prompt";

    # Confirm before quitting lazygit (default: false)
    confirmOnQuit = false;
    # Quit when pressing escape/return at top level (default: false)
    quitOnTopLevelReturn = false;
  };
}

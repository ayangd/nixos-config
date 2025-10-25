{ username, ... }:
{
  enable = true;
  settings = {
    git = {
      paging = {
        colorArg = "always";
        # pager = "delta --dark --paging=never";
        # externalDiffCommand = "difft --color=always --display=inline";
      };

      # Default configurations before breaking changes
      autoForwardBranches = "none";
      localBranchSortOrder = "recency";
      remoteBranchSortOrder = "alphabetical";
    };

    # Default configurations before breaking changes
    gui = {
      useHunkModeInStagingView = false;
    };
  };
}

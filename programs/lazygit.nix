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
      autoForwardBranches = "none";
      localBranchSortOrder = "recency";
      remoteBranchSortOrder = "alphabetical";
    };
    gui = {
      useHunkModeInStagingView = false;
    };
  };
}
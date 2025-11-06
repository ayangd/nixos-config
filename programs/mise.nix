# Use Mise to manage project-specific tools.
# My coworkers uses mise, so I can make project dependencies and scripts
# available to them.
{ username, ... }:
{
  enable = true;
  enableBashIntegration = true;
  enableNushellIntegration = true;

  globalConfig = {
    settings = {
      idiomatic_version_file_enable_tools = [ ];
    };
  };
}

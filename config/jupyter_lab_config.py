import os

c = get_config()

cwd = os.getcwd()

# ------------------------------------------------------------------------------
# JupyterLab Templates extension configuration
# ------------------------------------------------------------------------------
c.JupyterLabTemplates.template_dirs = [f'{cwd}/templates']
c.JupyterLabTemplates.include_default = False
c.JupyterLabTemplates.include_core_paths = False

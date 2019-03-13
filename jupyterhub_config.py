# jupyterhub_config.py
c = get_config()

# Change from JupyterHub to JupyterLab
c.Spawner.default_url = '/lab'
c.Spawner.debug = True

# Administrators - set of users who can administer the Hub itself
c.Authenticator.admin_users = {'admin'}

# Change the startup directory
c.DockerSpawner.volumes = { 'jupyterhub-user-{username}': notebook_dir }
c.DockerSpawner.volumes = {
    'jupyterhub-user-{username}': notebook_dir,
    '/home/shares': '/home/brent/shares'
}

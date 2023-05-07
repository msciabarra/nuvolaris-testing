Start
  $ export EXTRA=D=1
  $ nuv setup status
  nothing installed yet
Docker
  $ nuv setup devcluster
  nuv setup docker create
  nuv setup kubernetes create
  nuv setup nuvolaris login
  $ nuv setup status
  nuv setup devcluster --status
  $ nuv setup devcluster --status
  nuv setup docker status
  $ nuv setup uninstall
  nuv setup devcluster --uninstall
  $ nuv setup devcluster --uninstall
  nuv setup docker delete
  $ nuv setup status
  nothing installed yet
Cluster no context
  $ nuv setup cluster
  nuv setup kubernetes create CONTEXT=
  nuv setup nuvolaris login
  $ nuv setup status
  nuv setup cluster  --status
  $ nuv setup cluster --status
  nuv setup kubernetes status CONTEXT=
  $ nuv setup uninstall
  nuv setup cluster --uninstall
  $ nuv setup cluster --uninstall
  nuv setup kubernetes delete CONTEXT=
  $ nuv setup status
  nothing installed yet
Cluster with context
  $ nuv setup cluster demo
  nuv setup kubernetes create CONTEXT=demo
  nuv setup nuvolaris login
  $ nuv setup status
  nuv setup cluster demo --status
  $ nuv setup cluster demo --status
  nuv setup kubernetes status CONTEXT=demo
  $ nuv setup uninstall
  nuv setup cluster demo --uninstall
  $ nuv setup cluster demo --uninstall
  nuv setup kubernetes delete CONTEXT=demo
  $ nuv setup status
  nothing installed yet
Server no user
  $ nuv setup server demo
  nuv setup k3s create SERVER=demo USERNAME=
  nuv setup kubernetes create
  nuv setup nuvolaris login
  $ nuv setup status
  nuv setup server demo  --status
  $ nuv setup server demo --status
  nuv setup k3s status SERVER=demo USERNAME=
  $ nuv setup uninstall
  nuv setup server demo --uninstall
  $ nuv setup server demo --uninstall
  nuv setup k3s delete SERVER=demo USERNAME=
  $ nuv setup status
  nothing installed yet
Server with user
  $ nuv setup server demo user
  nuv setup k3s create SERVER=demo USERNAME=user
  nuv setup kubernetes create
  nuv setup nuvolaris login
  $ nuv setup status
  nuv setup server demo user --status
  $ nuv setup server demo user --status
  nuv setup k3s status SERVER=demo USERNAME=user
  $ nuv setup uninstall
  nuv setup server demo user --uninstall
  $ nuv setup server demo user --uninstall
  nuv setup k3s delete SERVER=demo USERNAME=user
  $ nuv setup status
  nothing installed yet


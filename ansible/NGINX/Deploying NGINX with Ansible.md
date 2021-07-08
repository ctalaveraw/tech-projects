Deploying NGINX with Ansible

As an example of Ansible in action, NGINX can be deployed using a Ansible Playbook. A configuration can be declared using the modules in a Playbook.

Steps will be spelled out on how NGINX will be deployed, on all relevant servers, using a Playbook written in YAML named `playbook_nginx_install.yaml` :

```
$ nano playbook_nginx_install.yaml
```

The YAML file starts with three dashes --- starting the first `block.`

Nested one level, as indicated by a dash `-` within the `block` is the `hosts:` statement, representing the server grouping for the Playbook to target, which would be the group `local`  in this example, containing only `localhost`.

Another nested statement within the `block` is the `become:` statement, indicating on if this task will run with elevated privileges; in this case the task is installing an application, so it would need elevated privileges to run properly and needs the value to be set as `true` : 

```
---
- hosts: local
  become: true
```

The next statement will also be at the same indentation level, which will be the `tasks:` statement

Nested within this will be the first task; the `name:` statement holds the description of the task.

On the same indentation level, the `module` being used will be expressed; this will use the  `yum:` module to install the NGINX software.

Indented one level deeper would be the `name:` statement, representing the application needing installation; the `state:` statement represents the task to be done, in this case the module will check to see if NGINX is installed, and will do so if not, so the value will be set to  `present`:

```YAML
---
- hosts: local
  become: true
  tasks:
    - name: Install the NGINX application on localhost
      yum:
        name: nginx
        state: present
```

The same thing can be repeated for the `service` module, which will start the NGINX service.

Nested within the service module is the `name:` statement, representing the application needing to be manipulated; the `state:` statement represents the action to be performed, in this case to start the service, the value will be set to started:

```
---
- hosts: local
  become: true
  tasks:
    - name: Install the NGINX application on localhost
      yum:
        name: nginx
        state: present
    - name: Start the NGINX service
      service:
        name: nginx
        state: started
```

Running the Playbook demonstrates that the install of NGINX is successful:

```
$ sudo ansible-playbook playbook_nginx_install.yaml --connection=local

PLAY [local] ****************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
ok: [127.0.0.1]

TASK [Install the NGINX application on localhost] ***************************************************************
changed: [127.0.0.1]

TASK [Start the NGINX service] **********************************************************************************
changed: [127.0.0.1]

PLAY RECAP ******************************************************************************************************
127.0.0.1                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Since Ansible is idempotent, running the Playbook again will perform no changes:

```
$ sudo ansible-playbook playbook_nginx_install.yaml --connection=local

PLAY [local] ****************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
ok: [127.0.0.1]

TASK [Install the NGINX application on localhost] ***************************************************************
ok: [127.0.0.1]

TASK [Start the NGINX service] **********************************************************************************
ok: [127.0.0.1]

PLAY RECAP ******************************************************************************************************
127.0.0.1                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Based on the created `playbook_nginx_install.yaml` Playbook, a version can be created, named `playbook_nginx_uninstall.yaml`, that would do the mirror.

The NGINX service will be stopped, and the application installed; the other Playbook's content is listed below:

```
---
- hosts: local
  become: true
  tasks:
    - name: Stop the NGINX service
      service:
        name: nginx
        state: stopped
    - name: Uninstall the NGINX application on localhost
      yum:
        name: nginx
        state: absent
```

Running the Playbook demonstrates that the NGINX application is successfully removed:

```
$ sudo ansible-playbook playbook_nginx_uninstall.yaml --connection=local

PLAY [local] ****************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
ok: [127.0.0.1]

TASK [Stop the NGINX service] ***********************************************************************************
changed: [127.0.0.1]

TASK [Uninstall the NGINX application on localhost] *************************************************************
changed: [127.0.0.1]

PLAY RECAP ******************************************************************************************************
127.0.0.1                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
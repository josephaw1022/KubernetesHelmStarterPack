

run these playbooks to provision cluster

```
ansible-playbook -i inventory.ini playbooks/configure_initial_master.yml --ask-become-pass
ansible-playbook -i inventory.ini playbooks/configure_additional_masters.yaml --ask-become-pass
ansible-playbook -i inventory.ini playbooks/configure_workers.yaml --ask-become-pass
```


run the following command on each host before running playbooks 


```
#!/bin/bash

# Define your SSH public key
PUB_KEY=<your-pub-key> # should just be the contents of ~/.ssh/id_rsa.pub

# Ensure the .ssh directory exists
mkdir -p ~/.ssh

# Set the correct permissions for the .ssh directory
chmod 700 ~/.ssh

# Create the authorized_keys file if it does not exist
touch ~/.ssh/authorized_keys

# Add the public key to the authorized_keys file if not already present
if ! grep -Fxq "$PUB_KEY" ~/.ssh/authorized_keys; then
  echo "$PUB_KEY" >> ~/.ssh/authorized_keys
fi

# Set the correct permissions for the authorized_keys file
chmod 600 ~/.ssh/authorized_keys

echo "Public key added successfully to authorized_keys."


```
Ansible project skeleton
========================

[![N|Solid](http://www.ippon.tech/wp-content/uploads/2016/07/logo_ippon-rouge-e1468235974595.png)](http://www.ippon.fr)

Skeleton for starting an Ansible project following "best-pratices".

----
Running this example
========================
You can run this example using the following command  :
```
ansible-playbook -i inventory/staging playbooks/main.yml
```

----
How to develop and test in a VM ? 
========================

Step 1 : Develop your Ansible playbooks as you would normally do
----------------------------------------------------------------

 
Step 2 : Run and test your playbooks using Vagrant and VirtualBox 
----------------------------------------------------------------
**Running for the first time (in the tests/roles/myrole directory) :** 

    cd tests/roles/myrole ; 
    vagrant up ;

Then, you will have to open two terminal on the same working directory.
First terminal will be connecting to the virtual machine where you want to test, using SSH : 

    vagrant ssh ;
    specs ; # will download Ansible

The second terminal will be synchronizing your playbooks into the virtual machine :

    cd tests/roles/myrole ; 
    vagrant rsync-auto

You are ready to go :-)

**Executing your playbooks and tests (assertions) :** 
In the terminal connected to the virtual machine via SSH. You can run the command :

    specs -p # -p option avoid to download Ansible in order to execute tests faster 
Please find more documentation one the rolespec github page : https://github.com/nickjj/rolespec 
 
Step 3 : Test your playbooks  
----------------------------------------------------------------
Now that your playbooks look's ready, you can test it on a full environnement (no VM), where it will be executed.
Check that everything is working as you wish, and go back to step 2 if you find some bugs.

Useful links
========================
- [Ansible : Filters string] (https://github.com/lxhunter/ansible-filter-plugins)
- [Ansible : test driven developpement] (https://github.com/nickjj/rolespec) 
- [Ansible : best pratices] (https://github.com/enginyoyen/ansible-best-practises%C2%A0) 

----
About Ippon
========================
We love to address our clients' toughest challenges, and we truly believe technology is a key driver of business and social changes.

We are a consulting and software design company. Like millions of others.

YET, we are also a community of passionate and proficient individuals.
*Like no other.* :-)
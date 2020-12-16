/*Adding and Removing Users and Groups

Adding a new user is done with useradd and removing an existing user is done with userdel. In the simplest form, an account for the 
new user bjmoose would be done with:*/
$ sudo /usr/sbin/useradd bjmoose

/*which, by default, sets the home directory to /home/bjmoose, populates it with some basic files (copied from /etc/skel), adds a line 
to /etc/passwd such as:*/
bjmoose:x:1002:1002::/home/bjmoose:/bin/bash

/*and sets the default shell to /bin/bash.

Additional options can be specified to change these properties, and to set others, such as the user name, etc. (see man useradd).

Before the account can be used, a password must be set. This can be done with the -p option to useradd, or by doing:*/
$ sudo passwd bjmoose


/*which will then prompt for adding a password.

Note that only the superuser, or root, has the right to establish (or remove) an account.

Removing a user account is as easy as:*/
$ sudo /usr/sbin/userdel bjmoose



/*However, this will leave the /home/bjmoose directory intact. This might be useful if it is a temporary inactivation, for example. 
To remove the home directory while removing the account, you need to use the -r option to userdel.

 You can change the user’s characteristics after the account has been established with usermod. For example, you could use the -d 
 option to change the home directory, or the -p option to change the password.

Adding a new group is done with groupadd:*/
$ sudo /usr/sbin/groupadd anewgroup


/*establishes the group anewgroup with default properties. The group can be removed with:*/
$ sudo /usr/sbin/groupdel anewgroup


/*Adding a user to an already existing group is done with usermod. For example, you would first look at what groups the user already 
belongs to:*/
$ groups bjmoose
bjmoose : bjmoose

/*and then, add the new group:*/
$ sudo /usr/sbin/usermod -aG anewgroup bjmoose
$ groups bjmoose
/*bjmoose: rjsquirrel anewgroup

Once again, these utilities must be run as superuser or root, and update /etc/group as necessary. The groupmod utility can be 
used to change the group’s properties, most often the numerical Group ID with the -g option, or its name with the -m option.

Removing a user from the group is somewhat trickier. The -G option to usermod must be given a complete list of groups. Thus, 
if you do:*/
$ sudo /usr/sbin/usermod -G rjsquirrel rjsquirrel
$ groups rjsquirrel
/*rjsquirrel : rjsquirrel

only the rjsquirrel group will be left.

An additional command, id, can be used to quickly glimpse user information. With no argument, it gives information about the current 
user, as in:*/
$ id
/*uid=1000(george) gid=1000(george) groups=106(fuse),1000(george)
If given the name of another user as an argument, id will report information about that other user.*/

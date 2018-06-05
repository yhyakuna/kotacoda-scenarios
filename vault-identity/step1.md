You are going to create a new entity with base policy assigned.  The entity defines two entity aliases with each has a different policy assigned.

**Scenario:**  

A user, Bob Smith at ACME Inc. happened to have two sets of credentials: `bob` and `bsmith`.  To manage his accounts and link them to an identity `Bob Smith` in team, QA, you are going to create an entity for Bob.

![Entity Bob Smith](images/7-entity.png)

For the purpose of training, you are going to work with the userpass auth method.  But in reality, the user `bob` might be a username exists in Active Directory, and `bsmith` might be Bob's username in GitHub, etc.


Execute the following command to enable the userpass auth method:

```
vault auth enable userpass
```{{execute}}

Next, create a new policy named, `base`:

```
docker cp base.hcl vault:/base.hcl
clear
vault policy write base base.hcl
```{{execute}}

To review the created policy:

```
vault policy read base
```{{execute}}

This policy grants CRUD operations on the path starting with `secret/training`.

<br>
Let's create two more policies: `test` and `team-qa`.

Execute the following command to create `test` policy.

```
docker cp test.hcl vault:/test.hcl
vault policy write test test.hcl
```{{execute}}


Execute the following command to create `team-qa` policy.

```
docker cp team-qa.hcl vault:/team-qa.hcl
vault policy write team-qa team-qa.hcl
```{{execute}}


At this point, you should have `base`, `test`, and `team-qa` policies:

```
vault policy list
```{{execute}}


## Create Users

Create a new user in userpass backend:

- **username:** bob
- **password:** training
- **policy:** test

```
vault write auth/userpass/users/bob password="training" \
    policies="test"
```{{execute}}


Create another user in userpass backend:

- **username:** bsmith
- **password:** training
- **policy:** team-qa

```
vault write auth/userpass/users/bsmith password="training" \
      policies="team-qa"
```{{execute}}
Now, you are going to create an internal group named, engineers.  Its member is `bob-smith` entity that you created in Task 1.

Log back in with the root token:

```
vault login $(cat root_token.txt)
```{{execute}}


First, create a new policy so that you can test the capability inheritance:

Create a policy named, `team-eng` which grants CRUD operations on the `secret/team/eng` path.

```
docker cp team-eng.hcl vault:/team-eng.hcl
clear
vault policy write team-eng team-eng.hcl
```{{execute}}

<br>

## Create an Internal Group

Execute the following command to create an internal group named, `engineers` and add `bob-smith` entity as a group member.  Also, assign the newly created `team-eng` policy to the group.

```
vault write -format=json identity/group name="engineers" \
      policies="team-eng" \
      member_entity_ids=$(cat entity_id.txt) \
      metadata=team="Engineering" \
      metadata=region="North America" \
      | jq -r ".data.id" > group_id.txt
```{{execute}}

The generated group ID is stored in the `group_id.txt` file.

Execute the following command to read the details of the group, `qa-entineers`:

```
vault read identity/group/id/$(cat group_id.txt)
```{{execute}}


> By default, Vault creates an internal group, and you don't create any alias for internal groups.  Group aliases are mapping between Vault and the external identity provider.  Therefore, you define group aliases when you create external groups.  For internal groups, you have `member_group_ids` and/or `member_group_ids` instead.
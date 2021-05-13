# Using the CLI

## Installation

<div class="termy">

```console
$ pip install hopcolony

---> 100%
```

</div>

## Login

Before you start using the CLI, you will need to login with your user:

```
hopctl login
```

After signing in with the pop-up browser window, you will get prompted to select the project you want to work on.

You can always check the config of your current project by doing:

<div class="termy">

```console
$ hopctl config get

project: example_project
token: LypdFfm7ZQhjZTt
username: example@hopcolony.io
```

</div>

## Authentication

You can list all the users in the project:

<div class="termy">

```console
$ hopctl get user

TODO
```

</div>

You can describe a specific user with:

<div class="termy">

```console
$ hopctl describe user uid

TODO
```

</div>

## Documents

You can get all the indices in your database: 

<div class="termy">

```console
$ hopctl get index

TODO
```

</div>

You can then describe a specific index:

<div class="termy">

```console
$ hopctl describe index users

TODO
```

</div>

If you want to get some specific fields from the documents, user the cols flag:

<div class="termy">

```console
$ hopctl describe index users --cols name,surname,email

TODO
```

</div>

You can also describe a specific doc by providing the uuid:

<div class="termy">

```console
$ hopctl describe index users --doc dsfsdf

TODO
```

</div>

## Drive

You can list all the buckets in the database:

<div class="termy">

```console
$ hopctl get bucket

TODO
```

</div>

You can describe the bucket to get all the objects within it:

<div class="termy">

```console
$ hopctl describe bucket photos

TODO
```

</div>

You can also describe a specific object in the bucket:

<div class="termy">

```console
$ hopctl describe bucket photos --obj sea.png

TODO
```

</div>
# vnew
Quickly create new files or folders (folders end with `/`).
Created using [the V programming language](https://github.com/vlang/v).

## Examples:
```
vnew abd/def/x.txt
```
... creates the abd/def/ folder if it does not exist already, and then add a new empty file x.txt inside it.

```
vnew a.txt b.txt abcd/xyz.txt folder/
```
... creates all 3 files, then create an empty `folder/` too.

## [Source](vnew.v):
![image](https://user-images.githubusercontent.com/26967/111912607-169a1180-8a73-11eb-8197-a20340481cb5.png)

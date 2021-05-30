Manual DevOps
==================

--------------------
#### ACL no Linux
setfacl permite atribuir para um usuário ou grupo, mesmo que não esteja dentro do padrão(rwx) leitura,escrita como “exerceção”.

setfacl -m user:jeferson-sousa:rwx arquivo

setfacl -m user:grupo_teste:rwx arquivo

getfacl arquivo : Infomações sobre as permissões do arquivo.
 

--------------------

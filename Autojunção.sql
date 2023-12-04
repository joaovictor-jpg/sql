select funcionario.ename || ' Trabalha para ' || gerente.ename "Funcionario e gerente"
from scott.emp funcionario join scott.emp gerente
on (funcionario.mgr = gerente.empno);
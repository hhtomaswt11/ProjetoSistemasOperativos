#!/bin/bash

# Verifica se o Makefile existe
if [ -f "Makefile" ]; then
    # Executa o make
    make
    sleep 2
    # Limpa a tela
    clear
    gnome-terminal -- "./orchestrator" SJF
    start=$(date +%s%N)
    ./client execute 40 -u "ls -l"
    ./client execute 30 -u "ls"
    ./client execute 100 -u "man ascii"
    ./client execute 80 -u "man strcmp"
    end=$(date +%s%N)
    runtime=$(( (end-start)/1000000 ))
    echo -e "\n----------\e[32mTeste SJF\e[0m----------\n"
    echo -e "\e[32m\nExecução da tarefa 1\e[0m : ls -l\n"
    # cat "Resultados/output_1.txt"
    sleep 1
    echo -e "\e[32m\nExecução da tarefa 2\e[0m : ls\n"
    # cat "Resultados/output_2.txt"
    sleep 1
    echo -e "\e[32m\nExecução da tarefa 3\e[0m : man ascii\n"
    # cat "Resultados/output_3.txt"
    sleep 1
    echo -e "\e[32m\nExecução da tarefa 4\e[0m : man strcmp\n"
    # cat "Resultados/output_4.txt"

    echo -e "\e[32m\nTempo de execução\e[0m: $runtime milissegundos\n"
    echo -e "\n------------------------------\n"
    sleep 5
    # Executa make clean
    make clean
    sleep 2
    clear
else
    echo "Erro: Makefile não encontrado."
    exit 1
fi

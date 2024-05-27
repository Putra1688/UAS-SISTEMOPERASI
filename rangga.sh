#!/bin/bash

echo "PEMROGRAMAN SHELL"
echo "======================="
ulangi="y"
while [ "$ulangi" == "y" ]; do
    echo "_________________________________________"
    echo "Masukkan operasi yang ingin dijalankan : "
    echo "1. Melihat isi Direktory"
    echo "2. Melihat proses parent dan proses child"
    echo "3. Membuat dua proses sebanyak 5 kali"
    echo "4. Melihat Manajemen Memori"
    echo "----------------------------------------"
    read -p "Masukkan pilihan: " menu

    case $menu in
    1)
        ls
        ;;
    2)
        echo "Proses parent dan child:"
        ps -ef --forest
        ;;
    3)
        
        child_process() {   # mendefinisikan loop yang mencetak PID (Process ID) 
                            # dari proses yang sedang berjalan dan tidur selama 2 detik setiap iterasi
        for i in {1..5}; do
            echo "Ini adalah process $$"
            sleep 2
        done
        }

        # Menjalankan fungsi di latar belakang
        child_process &
        parent_pid=$! # menyimpan PID dari proses terakhir yang diluncurkan di latar belakang menggunakan operator '&'

        # Ensure the parent process waits for the child to complete
        wait $parent_pid
        ;;
    4)
        sudo dmesg | more
        ;;
    *)
        echo "Pilihan tidak valid!"
        ;;
    esac

    read -p $'Apakah ingin mengulangi operasi lagi? (y/n) : ' ulangi
    clear
done

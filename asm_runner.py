import subprocess, sys, os

if len(sys.argv) != 2:
    print('Error in arguments argv, just one file')
else:
    argv = sys.argv[1]
    file_name = argv.replace('.asm', '')
    nasm_command = f'nasm -felf64 {file_name}.asm -o {file_name}.o'.split(' ')
    ld_command = f'ld -o {file_name} {file_name}.o'.split(' ')
    chmod_command = f'chmod u+x {file_name}'.split(' ')
    run_command = f'./{file_name}'.split(' ')

    subprocess.run(nasm_command)
    subprocess.run(ld_command)
    subprocess.run(chmod_command)
    subprocess.run(run_command)

    os.remove(f'{file_name}.o')
    os.remove(file_name)


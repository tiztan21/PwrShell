Import-Module ActiveDirectory
$cpus= Import-csv C:\Users\marcos.iztanko\Documents\Codis\listCPU.csv

foreach ($cpu in $cpus)
    {
        $desc= get-ADComputer $cpu.name -properties *|select-object description
        Write-Output ("Actualizando a " + $cpu.name)
        if($desc="")
            {
                Set-ADComputer -Identity $cpu.name -add @{description=$cpu.Descripcion}
            }
        else
            {
                Set-ADComputer -Identity $cpu.name -Replace @{description=$cpu.Descripcion}
            }
    }
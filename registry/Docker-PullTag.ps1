param(
    $registry = 'registry.localhost'
)

$Hashtable = ConvertFrom-Yaml (Get-Content '.\registry.yml' -Raw) -AllDocuments

$Hashtable.GetEnumerator() 
| Where-Object Name -NotMatch $registry
| ForEach-Object {
    
    $_.Name | Write-Host

    $_.Name
    | ForEach-Object {
        $tag = '{0}/{1}' -f $registry, $_
        docker pull $_
        docker tag $_ $tag
    }

}
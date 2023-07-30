param(
    $registry = 'registry.localhost'
)

docker image ls --format json
| ConvertFrom-Json
| Where-Object Repository -match $registry
| ForEach-Object {

    $_.Repository | Write-Host

    docker push $_.Repository
    
}
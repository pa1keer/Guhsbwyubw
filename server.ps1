$port = 9000
$endpoint = New-Object System.Net.IPEndPoint([IPAddress]::Any, $port)
$listener = New-Object System.Net.Sockets.TcpListener $endpoint
$listener.Start()

Write-Host "Сервер слушает порт $port..." -ForegroundColor Green

while($true) {
    $client = $listener.AcceptTcpClient()
    $stream = $client.GetStream()
    $reader = New-Object System.IO.StreamReader $stream
    $writer = New-Object System.IO.StreamWriter $stream
    
    $data = $reader.ReadLine()
    Write-Host "Получено: $data" -ForegroundColor Yellow
    
    $response = "OK: $(Get-Date)"
    $writer.WriteLine($response)
    $writer.Flush()
    
    $client.Close()
}
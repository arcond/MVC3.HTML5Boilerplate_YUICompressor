param($installPath, $toolsPath, $package, $project)

$added = 0
foreach ($prop in $project.Properties) {
	if ($prop.Name -eq "PostBuildEvent") {
		if ($prop.Value -eq "") {
			write-host 'Appending post-build event'
			$prop.Value = "`$(MSBuildBinPath)\msbuild.exe `"`$(ProjectDir)MSBuild\CompressionSettings.xml`""
		} else {
			write-host 'Creating post-build event'
			$prop.Value = "$prop.Value`r`n`$(MSBuildBinPath)\msbuild.exe `"`$(ProjectDir)MSBuild\CompressionSettings.xml`""
		}
		$added = 1
	}
}
if ($added -eq 0) {
	write-host 'Creating post-build event'
	$prop.Value = "`$(MSBuildBinPath)\msbuild.exe `"`$(ProjectDir)MSBuild\CompressionSettings.xml`""
	$added = 1
}
write-host 'YUI compression added to post-build event'
param($installPath, $toolsPath, $package, $project)

foreach ($prop in $project.Properties) {
	if ($prop.Name -eq "PostBuildEvent") {
		if ($prop.Value -eq "") {
			write-host 'Removed post-build event'
		} elseif ($prop.Value.Trim() -eq "`$(MSBuildBinPath)\msbuild.exe `"`$(ProjectDir)MSBuild\CompressionSettings.xml`"") {
			$prop.Value = ""
			write-host 'Removed YUI Compression post-build event'
		} else {
			$banana = $prop.Value.Split("`n");
			$dessert = ""
			foreach ($scoop in $banana) {
				if ($scoop.Trim() -ne "`$(MSBuildBinPath)\msbuild.exe `"`$(ProjectDir)MSBuild\CompressionSettings.xml`"") {
					$dessert = "$dessert$scoop`n"
				}
			}
			$prop.Value = $dessert.Trim()
			write-host 'Removed YUI Compression post-build event'
		}
	}
}
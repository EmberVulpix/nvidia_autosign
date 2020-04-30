# nvidia_autosign
Set of scripts and all tools to automatically sign modified NVIDIA INFs. Ensure Secure Boot is disabled when installing. `signtool` and `Inf2Cat` are latest as of Windows 10 RS4.

1. Make your NVIDIA INF modifications.
2. Clone this repo.
3. Extract `SelfCert.zip` (from repo) or download it from [Plurasight](https://www.pluralsight.com/blog/software-development/selfcert-create-a-self-signed-certificate-interactively-gui-or-programmatically-in-net).
4. Run `SelfCert.exe` and set the options as follows:
	*	**X.500 distinguished name:** `cn=name_here,o=org_here,e=email@example.com`, replace `name_here`, `org_here`, and `email@example.com` with whatever you want.
	*	**Key size:** `2048`.
	*	**Valid from:** current date.
	*	**Valid to:** 5 to 10 years.
	*	**Password:** something you remember.
5. In SelfCert, click **Save to PFX File** and save as `my.pfx`.
6. Use [OpenSSL](https://wiki.openssl.org/index.php/Binaries) to extract `my.cer` from `my.pfx`: `openssl.exe pkcs12 -in my.pfx -out my.cer -nokeys -clcerts` When prompted by OpenSSL, enter the password you entered into SelfCert.
7. Run `certmgr.msc`
	*	Expand **Trusted Root Certification Authorities**.
	*	Go to **Certificates** > **All Tasks** > **Import** and tap **Next >**.
	*	Browse to `my.cer` when prompted for the file to import and tap **Next >**.
	*	Ensure that **Place all certificates in the following store** is selected and **Trusted Root Certification Authorities** is populated in the store field. Tap **Next >**.
	*	Tap **Finish**.
8. Place `my.pfx` in the `signtool` directory from this repo.
9. Place `my.cer` next to `sign7.bat` and `sign10.bat` from this repo.
10. Run either `sign7.bat path\to\Display.Driver` or `sign10.bat path\to\Display.Driver` depending on your OS.
11. Wait for signing to finish.
12. Install NVIDIA drivers normally.

s/o [CHEF-KOCH](https://github.com/CHEF-KOCH/nVidia-modded-Inf)

NVIDIA is a registered trademark of NVIDIA Corporation in the U.S. and other countries.
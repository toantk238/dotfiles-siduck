local pyenv_path = os.getenv("VIRTUAL_ENV")
if pyenv_path then
	local python_bin_path = pyenv_path .. "/bin/python"
	require("dap-python").setup(python_bin_path)
end

local present, dap_python = pcall(require, "dap-python")

if not present then
	return
end

local pyenv_path = os.getenv("PYENV_VIRTUAL_ENV")
if pyenv_path then
	local python_bin_path = pyenv_path .. "/bin/python"
	dap_python.setup(python_bin_path)
end

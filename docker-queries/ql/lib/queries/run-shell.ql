import dockerfile

from dockerfile::RunInstruction run
where run.getChild(0) instanceof dockerfile::ShellCommand
select run, "This RUN instruction uses a shell command."


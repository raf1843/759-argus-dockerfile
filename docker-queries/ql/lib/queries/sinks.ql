import dockerfile
import codeql.Locations as L

from dockerfile::AstNode a
where a instanceof dockerfile::CmdInstruction or a instanceof dockerfile::EntrypointInstruction
select "Implicit args", "Input", a, a.getLocation().toString(), a.getParent().toString()
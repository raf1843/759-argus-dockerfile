import dockerfile
import codeql.Locations as L

from dockerfile::AstNode a
where a instanceof dockerfile::CmdInstruction or a instanceof dockerfile::EntrypointInstruction
select "Implicit flow", "Implicit sources", a, a.toString()
import dockerfile
import codeql.Locations as L

from dockerfile::EntrypointInstruction e
select e, "ENTRYPOINT", e.getLocation()

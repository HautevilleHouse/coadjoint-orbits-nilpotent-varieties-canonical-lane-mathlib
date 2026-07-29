import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CoadjointSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CoadjointAdmittedObject where
  space : CoadjointSpace
  nilpotentVariety : Prop
  coadjointOrbit : Prop
  orbitClosureInNilpotentVariety : Prop
  orbitModel : Type
  orbitTopology : TopologicalSpace orbitModel
  orbitClosureMatches : Prop
  conclusion : orbitClosureMatches

structure CoadjointEndgameState where
  object : CoadjointAdmittedObject

def CoadjointWitnessClosed (O : CoadjointAdmittedObject) : Prop :=
  O.orbitClosureMatches

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse

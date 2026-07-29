import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure OrbitClosurePackage {G : Type u} [LieGroup G]
    (N : NilpotentVariety G) where
  orbit : CoadjointOrbit G
  closure : Set (CoadjointOrbit G)
  irreducibleComponents : List (Set (CoadjointOrbit G))
  closureDegrees : Prop
  componentGeometries : Prop

structure OrbitClosureEvidence {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (O : OrbitClosurePackage N) where
  closureDegreesClosed : O.closureDegrees
  componentGeometriesClosed : O.componentGeometries

def OrbitClosureClosed {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (O : OrbitClosurePackage N) : Prop :=
  O.closureDegrees ∧ O.componentGeometries

theorem orbit_closure_closed_from_evidence
    {G : Type u} [LieGroup G] {N : NilpotentVariety G}
    (O : OrbitClosurePackage N) (E : OrbitClosureEvidence O) :
    OrbitClosureClosed O := by
  exact And.intro E.closureDegreesClosed E.componentGeometriesClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
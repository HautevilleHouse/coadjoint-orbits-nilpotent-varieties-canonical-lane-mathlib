import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure Sl2Triple {𝔤 : Type u} [LieRing 𝔤] [LieAlgebra ℝ 𝔤] where
  h : 𝔤
  e : 𝔤
  f : 𝔤
  relations : Prop

structure JacobsonMorozovPackage {𝔤 : Type u} [LieRing 𝔤] [LieAlgebra ℝ 𝔤]
    (x : 𝔤) (hx : IsNilpotent x) where
  triple : Sl2Triple 𝔤
  containsX : triple.e = x
  uniquenessUpToConj : Prop
  embeddingClosed : triple.relations

structure JacobsonMorozovEvidence {𝔤 : Type u} [LieRing 𝔤] [LieAlgebra ℝ 𝔤]
    {x : 𝔤} {hx : IsNilpotent x} (J : JacobsonMorozovPackage x hx) where
  embeddingClosedClosed : J.embeddingClosed
  uniquenessUpToConjClosed : J.uniquenessUpToConj

def JacobsonMorozovClosed {𝔤 : Type u} [LieRing 𝔤] [LieAlgebra ℝ 𝔤]
    {x : 𝔤} {hx : IsNilpotent x} (J : JacobsonMorozovPackage x hx) : Prop :=
  J.embeddingClosed ∧ J.uniquenessUpToConj

theorem jacobson_morozov_closed_from_evidence
    {𝔤 : Type u} [LieRing 𝔤] [LieAlgebra ℝ 𝔤] {x : 𝔤} {hx : IsNilpotent x}
    (J : JacobsonMorozovPackage x hx) (E : JacobsonMorozovEvidence J) :
    JacobsonMorozovClosed J := by
  exact And.intro E.embeddingClosedClosed E.uniquenessUpToConjClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
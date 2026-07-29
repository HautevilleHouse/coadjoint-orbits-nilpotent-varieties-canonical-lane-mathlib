import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure SymplecticForm {G : Type u} [LieGroup G] (O : CoadjointOrbit G) where
  form : O → O → ℝ
  closed : Prop
  nondegenerate : Prop
  lieCompatible : Prop

structure KostantKirillovFormPackage {G : Type u} [LieGroup G]
    (N : NilpotentVariety G) where
  orbit : CoadjointOrbit G
  form : SymplecticForm G orbit
  orbitStrata : String
  formClosed : form.closed
  formNondegenerate : form.nondegenerate

structure KostantKirillovFormEvidence {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (K : KostantKirillovFormPackage N) where
  formClosedClosed : K.formClosed
  formNondegenerateClosed : K.formNondegenerate

def KostantKirillovFormClosed {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (K : KostantKirillovFormPackage N) : Prop :=
  K.formClosed ∧ K.formNondegenerate

theorem kostant_kirillov_form_closed_from_evidence
    {G : Type u} [LieGroup G] {N : NilpotentVariety G}
    (K : KostantKirillovFormPackage N) (E : KostantKirillovFormEvidence K) :
    KostantKirillovFormClosed K := by
  exact And.intro E.formClosedClosed E.formNondegenerateClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
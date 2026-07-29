import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure RadianceDistribution (X : Type u) where
  outgoing : X -> Float -> Type v
  incoming : X -> Float -> Type v

structure BSDF (X : Type u) where
  scattering : X -> X -> Float -> Float -> Float -> Type w
  energyConservation : Prop
  reciprocity : Prop

structure RenderingEquationPackage (X : Type u) where
  radiance : X -> Float -> Float -> Float -> Float
  bsdf : BSDF X
  emission : X -> Float -> Float -> Float -> Float
  visibility : X -> X -> Prop
  equationHolds : Prop
  integralFormulation : Prop
  pathIntegralForm : Prop

structure RenderingEquationEvidence {X : Type u} (R : RenderingEquationPackage X) where
  equationHoldsClosed : R.equationHolds
  integralFormulationClosed : R.integralFormulation
  pathIntegralFormClosed : R.pathIntegralForm

def RenderingEquationClosed {X : Type u} (R : RenderingEquationPackage X) : Prop :=
  R.equationHolds ∧ R.integralFormulation ∧ R.pathIntegralForm

theorem rendering_equation_closed_from_evidence {X : Type u} (R : RenderingEquationPackage X) (E : RenderingEquationEvidence R) : RenderingEquationClosed R := by
  exact And.intro E.equationHoldsClosed
    (And.intro E.integralFormulationClosed E.pathIntegralFormClosed)

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse
// Made with Amplify Shader Editor v1.9.1.6
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "UltimateDissolveFX_Shader"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Toggle]_CustomTexture("Custom Pattern Shape", Float) = 0
		_SizeWhenTransition("SizeWhenTransition", Range( 0 , 3)) = 1
		[Toggle(_INVERSEDIRECTION_ON)] _InverseDirection("InverseDirection", Float) = 0
		[NoScaleOffset]_MainColorMap("MainColorMap", 2D) = "white" {}
		_Transition("AnimationSpeed", Range( 0 , 1)) = 0.88
		[Toggle(_INVERSEANIMATION_ON)] _InverseAnimation("InverseAnimation", Float) = 0
		_Exp("Transition Falloff", Range( 0 , 2)) = 1
		_Tiling("Tiling", Range( 0 , 4)) = 1
		_MainColorMult("MainColorMult", Range( 0 , 24)) = 1
		_Push("Vertices Push Mult", Float) = 0
		_OffsetPivot("Pivot Offset (Obj Pivot Offset)", Vector) = (-16,0,0,1)
		_Angle("Rotation Angle", Float) = 8
		_Subdivision("Subdivision", Float) = 400
		[HDR]_ColorTransition("ColorTransition", Color) = (1,1,1,0)
		_SharpTransition("Transition Softness", Range( 0.05 , 2)) = 0.2
		_STEP("(Outlines) Steps", Range( 0 , 10)) = 0.3
		[Toggle]_DETAILES("Outlines (If Possible)", Float) = 0
		_Pattern("Pattern", 2D) = "white" {}
		_Distortion("Pattern Distortion", Range( 0 , 20)) = 0
		_TilingTransition("TilingTransition", Range( 0 , 10)) = 1
		_TransitionFactor("Transition Strength ", Range( -1 , 1)) = 0
		_NormalizedRotationAxis("Rotation Axis", Vector) = (0.05,0.2,1.1,0)
		_ManualTransition("Manual Transition", Range( 0 , 1)) = 0.5
		[Toggle(_MANUALAUTOMATIC_ON)] _ManualAutomatic("Manual / Automatic", Float) = 1
		_EmissiveFctor("Emissive Mult", Float) = 1
		[Toggle(_COLORMAP_ON)] _ColorMap("Color / Map", Float) = 1
		_ColorPow("Color Pow", Range( 0.25 , 5)) = 1
		[Toggle(_MAPMATCAP_ON)] _MapMatCap("Map / MatCap", Float) = 1
		[NoScaleOffset]_MainMap("MainMap", 2D) = "white" {}
		_MainColor("MainColor", Color) = (0.1415094,0.1415094,0.1415094,0)
		_Desaturation("Desaturation", Range( 0 , 1)) = 0
		_MaskMap("MaskMap", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 2)) = 0.2
		_NormalMap("Normal Map", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 2)) = 0.2
		[Toggle(_USENORMALMAP_ON)] _UseNormalMap("UseNormalMap", Float) = 0
		[Toggle(_TRANSITIONXVSY_ON)] _TransitionXvsY("Transition Axis : X vs Y", Float) = 0
		[Toggle(_CUSTOMPIVOT_ON)] _CustomPivot("New Custom Pivot Position", Float) = 0
		_CustomPivotVec("CustomPivotVec", Vector) = (0,0,0,0)
		[ASEEnd][Toggle(_USEMAINTEXTURE_ON)] _UseMainTexture("UseMainTexture", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1.0
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4 				// DEPRECATED
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4	// DEPRECATED
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4 // Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _EnableBlendModePreserveSpecularLighting("Enable Blend Mode Preserve Specular Lighting", Float) = 1
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)

		[HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0 //DoubleSidedGIMode added in api 12x and higher

		[HideInInspector][ToggleUI] _AlphaToMaskInspectorValue("_AlphaToMaskInspectorValue", Float) = 0 // Property used to save the alpha to mask state in the inspector
        [HideInInspector][ToggleUI] _AlphaToMask("__alphaToMask", Float) = 0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 ps4 ps5 

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 BaseColor;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float DiffusionProfile;
			float TransmissionMask;
			// Transmission + Diffusion Profile
			float Thickness;
			float SubsurfaceMask;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
			//Virtual Texturing
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
			}


			ColorMask [_LightLayersMaskBuffer4] 4
			ColorMask [_LightLayersMaskBuffer5] 5

			HLSLPROGRAM

            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140008


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment _ LIGHT_LAYERS
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_GBUFFER

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

		    // Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _MainMap;
			sampler2D _MainColorMap;
			sampler2D _Pattern;
			sampler2D _NormalMap;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON
			#pragma shader_feature_local _COLORMAP_ON
			#pragma shader_feature_local _MAPMATCAP_ON
			#pragma shader_feature_local _USEMAINTEXTURE_ON
			#pragma shader_feature_local _USENORMALMAP_ON


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float2 MyCustomExpression519( float3 normal )
			{
				float2 uv_matcap = normal *0.5 + float2(0.5,0.5); float2(0.5,0.5);
				return uv_matcap;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON
				builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float2 texCoord439 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = FinalDisplacement347;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_MainMap548 = packedInput.ase_texcoord5.xy;
				float4 tex2DNode548 = tex2D( _MainMap, uv_MainMap548 );
				float3 objToViewDir521 = TransformWorldToViewDir( TransformObjectToWorldDir( packedInput.ase_normal ));
				float3 normalizeResult520 = normalize( objToViewDir521 );
				float3 normal519 = normalizeResult520;
				float2 localMyCustomExpression519 = MyCustomExpression519( normal519 );
				float3 desaturateInitialColor527 = tex2D( _MainColorMap, localMyCustomExpression519 ).rgb;
				float desaturateDot527 = dot( desaturateInitialColor527, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar527 = lerp( desaturateInitialColor527, desaturateDot527.xxx, _Desaturation );
				float3 temp_cast_1 = (_ColorPow).xxx;
				#ifdef _MAPMATCAP_ON
				float4 staticSwitch547 = ( float4( pow( desaturateVar527 , temp_cast_1 ) , 0.0 ) * _MainColorMult * _ColorTransition );
				#else
				float4 staticSwitch547 = tex2DNode548;
				#endif
				#ifdef _COLORMAP_ON
				float4 staticSwitch546 = _MainColor;
				#else
				float4 staticSwitch546 = staticSwitch547;
				#endif
				#ifdef _USEMAINTEXTURE_ON
				float4 staticSwitch616 = tex2DNode548;
				#else
				float4 staticSwitch616 = _ColorTransition;
				#endif
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_3 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_3 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_4 = (0.0).xx;
				float2 temp_cast_5 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_5;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_6 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_6 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_7 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_7 ) / lerpResult13 );
				float2 temp_cast_8 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float clampResult395 = clamp( ( temp_output_252_0 * _STEP ) , 0.0 , 1.0 );
				float4 lerpResult310 = lerp( staticSwitch546 , ( ( staticSwitch616 * _EmissiveFctor * 1.0 ) * (( _DETAILES )?( frac( clampResult395 ) ):( 1.0 )) ) , pow( TransitionMask486 , _SharpTransition ));
				float4 FinalColor345 = lerpResult310;
				
				float2 uv_NormalMap = packedInput.ase_texcoord5.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				#ifdef _USENORMALMAP_ON
				float4 staticSwitch601 = tex2D( _NormalMap, uv_NormalMap );
				#else
				float4 staticSwitch601 = float4( packedInput.ase_normal , 0.0 );
				#endif
				
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.BaseColor = FinalColor345.rgb;
				surfaceDescription.Normal = staticSwitch601.rgb;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _Metallic;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = FinalColor345.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Occlusion = packedInput.ase_normal.x;
				surfaceDescription.Alpha = FinalAlpha346;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.1;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 0;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 140008


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _MainMap;
			sampler2D _MainColorMap;
			sampler2D _Pattern;
			sampler2D _NormalMap;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON
			#pragma shader_feature_local _COLORMAP_ON
			#pragma shader_feature_local _MAPMATCAP_ON
			#pragma shader_feature_local _USEMAINTEXTURE_ON
			#pragma shader_feature_local _USENORMALMAP_ON


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float2 MyCustomExpression519( float3 normal )
			{
				float2 uv_matcap = normal *0.5 + float2(0.5,0.5); float2(0.5,0.5);
				return uv_matcap;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT
			#define SCENEPICKINGPASS
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float2 texCoord439 = inputMesh.uv0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.uv0.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.uv0.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2.xy = inputMesh.uv0.xy;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = FinalDisplacement347;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				outputPackedVaryingsMeshToPS.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);


				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					outputPackedVaryingsMeshToPS.VizUV.xy = vizUV;
					outputPackedVaryingsMeshToPS.LightCoord = lightCoord;
				#endif

				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_MainMap548 = packedInput.ase_texcoord2.xy;
				float4 tex2DNode548 = tex2D( _MainMap, uv_MainMap548 );
				float3 objToViewDir521 = TransformWorldToViewDir( TransformObjectToWorldDir( packedInput.ase_normal ));
				float3 normalizeResult520 = normalize( objToViewDir521 );
				float3 normal519 = normalizeResult520;
				float2 localMyCustomExpression519 = MyCustomExpression519( normal519 );
				float3 desaturateInitialColor527 = tex2D( _MainColorMap, localMyCustomExpression519 ).rgb;
				float desaturateDot527 = dot( desaturateInitialColor527, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar527 = lerp( desaturateInitialColor527, desaturateDot527.xxx, _Desaturation );
				float3 temp_cast_1 = (_ColorPow).xxx;
				#ifdef _MAPMATCAP_ON
				float4 staticSwitch547 = ( float4( pow( desaturateVar527 , temp_cast_1 ) , 0.0 ) * _MainColorMult * _ColorTransition );
				#else
				float4 staticSwitch547 = tex2DNode548;
				#endif
				#ifdef _COLORMAP_ON
				float4 staticSwitch546 = _MainColor;
				#else
				float4 staticSwitch546 = staticSwitch547;
				#endif
				#ifdef _USEMAINTEXTURE_ON
				float4 staticSwitch616 = tex2DNode548;
				#else
				float4 staticSwitch616 = _ColorTransition;
				#endif
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_3 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_3 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_4 = (0.0).xx;
				float2 temp_cast_5 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_5;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_6 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_6 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_7 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_7 ) / lerpResult13 );
				float2 temp_cast_8 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float clampResult395 = clamp( ( temp_output_252_0 * _STEP ) , 0.0 , 1.0 );
				float4 lerpResult310 = lerp( staticSwitch546 , ( ( staticSwitch616 * _EmissiveFctor * 1.0 ) * (( _DETAILES )?( frac( clampResult395 ) ):( 1.0 )) ) , pow( TransitionMask486 , _SharpTransition ));
				float4 FinalColor345 = lerpResult310;
				
				float2 uv_NormalMap = packedInput.ase_texcoord2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				#ifdef _USENORMALMAP_ON
				float4 staticSwitch601 = tex2D( _NormalMap, uv_NormalMap );
				#else
				float4 staticSwitch601 = float4( packedInput.ase_normal , 0.0 );
				#endif
				
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.BaseColor = FinalColor345.rgb;
				surfaceDescription.Normal = staticSwitch601.rgb;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _Metallic;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = FinalColor345.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Occlusion = packedInput.ase_normal.x;
				surfaceDescription.Alpha = FinalAlpha346;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.1;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;

			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 140008


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			//#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_SHADOWS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
			#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Pattern;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float2 texCoord439 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = FinalDisplacement347;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_0 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_0 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_1 = (0.0).xx;
				float2 temp_cast_2 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_2;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_3 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_3 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_4 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_4 ) / lerpResult13 );
				float2 temp_cast_5 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.Alpha = FinalAlpha346;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.1;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmesh.positionCS.z;

				#ifdef _ALPHATOMASK_ON
				depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140008


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
		    #define SCENESELECTIONPASS 1

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Pattern;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float2 texCoord439 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = FinalDisplacement347;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_0 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_0 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_1 = (0.0).xx;
				float2 temp_cast_2 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_2;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_3 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_3 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_4 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_4 ) / lerpResult13 );
				float2 temp_cast_5 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.Alpha = FinalAlpha346;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.1;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM

            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140008


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _NormalMap;
			sampler2D _Pattern;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON
			#pragma shader_feature_local _USENORMALMAP_ON


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif
			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float2 texCoord439 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = FinalDisplacement347;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 uv_NormalMap = packedInput.ase_texcoord3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				#ifdef _USENORMALMAP_ON
				float4 staticSwitch601 = tex2D( _NormalMap, uv_NormalMap );
				#else
				float4 staticSwitch601 = float4( packedInput.ase_normal , 0.0 );
				#endif
				
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_2 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_2 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_3 = (0.0).xx;
				float2 temp_cast_4 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_4;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_5 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_5 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_6 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_6 ) / lerpResult13 );
				float2 temp_cast_7 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.Normal = staticSwitch601.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Alpha = FinalAlpha346;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.1;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#ifdef _ALPHATOMASK_ON
						depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM

            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140008


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_MOTION_VECTORS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _NormalMap;
			sampler2D _Pattern;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON
			#pragma shader_feature_local _USENORMALMAP_ON


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float2 texCoord439 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = FinalDisplacement347;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						if (_TransparentCameraOnlyMotionVectors > 0)
						{
							previousPositionRWS = VMESHpositionRWS.xyz;
						}
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			#if ( 0 ) // TEMPORARY: defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
				
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 uv_NormalMap = packedInput.ase_texcoord3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				#ifdef _USENORMALMAP_ON
				float4 staticSwitch601 = tex2D( _NormalMap, uv_NormalMap );
				#else
				float4 staticSwitch601 = float4( packedInput.ase_normal , 0.0 );
				#endif
				
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = packedInput.ase_texcoord4.xyz;
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_2 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_2 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_3 = (0.0).xx;
				float2 temp_cast_4 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_4;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_5 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_5 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_6 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_6 ) / lerpResult13 );
				float2 temp_cast_7 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.Normal = staticSwitch601.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Alpha = FinalAlpha346;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.1;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				// Depth and Alpha to coverage
				#ifdef WRITE_MSAA_DEPTH
					// In case we are rendering in MSAA, reading the an MSAA depth buffer is way too expensive. To avoid that, we export the depth to a color buffer
					depthColor = packedInput.vmeshPositionCS.z;

					// Alpha channel is used for alpha to coverage
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif

				// Normal Buffer Processing
				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					#endif
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);

					// make sure we don't overwrite light layers
					outDecalBuffer.w = (GetMeshRenderingLightLayer() & 0x000000FF) / 255.0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Blend 1 SrcAlpha OneMinusSrcAlpha

			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
			}


            ColorMask [_ColorMaskTransparentVelOne] 1
            ColorMask [_ColorMaskTransparentVelTwo] 2

			HLSLPROGRAM

            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140008


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH
			#pragma multi_compile_fragment AREA_SHADOW_MEDIUM AREA_SHADOW_HIGH
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_FORWARD
		    #define HAS_LIGHTLOOP 1

			// Setup for Fog Enabled to apply in sky refletions in LightLoopDef.hlsl
            #define APPLY_FOG_ON_SKY_REFLECTIONS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _MainMap;
			sampler2D _MainColorMap;
			sampler2D _Pattern;
			sampler2D _NormalMap;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON
			#pragma shader_feature_local _COLORMAP_ON
			#pragma shader_feature_local _MAPMATCAP_ON
			#pragma shader_feature_local _USEMAINTEXTURE_ON
			#pragma shader_feature_local _USENORMALMAP_ON


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float2 MyCustomExpression519( float3 normal )
			{
				float2 uv_matcap = normal *0.5 + float2(0.5,0.5); float2(0.5,0.5);
				return uv_matcap;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float2 texCoord439 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = FinalDisplacement347;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

            #ifdef UNITY_VIRTUAL_TEXTURING
                #ifdef OUTPUT_SPLIT_LIGHTING
                   #define DIFFUSE_LIGHTING_TARGET SV_Target2
                   #define SSS_BUFFER_TARGET SV_Target3
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                   #define MOTION_VECTOR_TARGET SV_Target2
            	#endif
            #if defined(SHADER_API_PSSL)
            	#pragma PSSL_target_output_format(target 1 FMT_32_ABGR)
            #endif
            #else
                #ifdef OUTPUT_SPLIT_LIGHTING
                #define DIFFUSE_LIGHTING_TARGET SV_Target1
                #define SSS_BUFFER_TARGET SV_Target2
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                #define MOTION_VECTOR_TARGET SV_Target1
                #endif
            #endif

			void Frag(PackedVaryingsMeshToPS packedInput
				, out float4 outColor:SV_Target0
            #ifdef UNITY_VIRTUAL_TEXTURING
				, out float4 outVTFeedback : SV_Target1
            #endif
            #ifdef OUTPUT_SPLIT_LIGHTING
				, out float4 outDiffuseLighting : DIFFUSE_LIGHTING_TARGET
				, OUTPUT_SSSBUFFER(outSSSBuffer) : SSS_BUFFER_TARGET
            #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
				, out float4 outMotionVec : MOTION_VECTOR_TARGET
            #endif
            #ifdef _DEPTHOFFSET_ON
				, out float outputDepth : DEPTH_OFFSET_SEMANTIC
            #endif
		    
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 1.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (uint2)round(input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_MainMap548 = packedInput.ase_texcoord7.xy;
				float4 tex2DNode548 = tex2D( _MainMap, uv_MainMap548 );
				float3 objToViewDir521 = TransformWorldToViewDir( TransformObjectToWorldDir( packedInput.ase_normal ));
				float3 normalizeResult520 = normalize( objToViewDir521 );
				float3 normal519 = normalizeResult520;
				float2 localMyCustomExpression519 = MyCustomExpression519( normal519 );
				float3 desaturateInitialColor527 = tex2D( _MainColorMap, localMyCustomExpression519 ).rgb;
				float desaturateDot527 = dot( desaturateInitialColor527, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar527 = lerp( desaturateInitialColor527, desaturateDot527.xxx, _Desaturation );
				float3 temp_cast_1 = (_ColorPow).xxx;
				#ifdef _MAPMATCAP_ON
				float4 staticSwitch547 = ( float4( pow( desaturateVar527 , temp_cast_1 ) , 0.0 ) * _MainColorMult * _ColorTransition );
				#else
				float4 staticSwitch547 = tex2DNode548;
				#endif
				#ifdef _COLORMAP_ON
				float4 staticSwitch546 = _MainColor;
				#else
				float4 staticSwitch546 = staticSwitch547;
				#endif
				#ifdef _USEMAINTEXTURE_ON
				float4 staticSwitch616 = tex2DNode548;
				#else
				float4 staticSwitch616 = _ColorTransition;
				#endif
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_3 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_3 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_4 = (0.0).xx;
				float2 temp_cast_5 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_5;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_6 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_6 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_7 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_7 ) / lerpResult13 );
				float2 temp_cast_8 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float clampResult395 = clamp( ( temp_output_252_0 * _STEP ) , 0.0 , 1.0 );
				float4 lerpResult310 = lerp( staticSwitch546 , ( ( staticSwitch616 * _EmissiveFctor * 1.0 ) * (( _DETAILES )?( frac( clampResult395 ) ):( 1.0 )) ) , pow( TransitionMask486 , _SharpTransition ));
				float4 FinalColor345 = lerpResult310;
				
				float2 uv_NormalMap = packedInput.ase_texcoord7.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				#ifdef _USENORMALMAP_ON
				float4 staticSwitch601 = tex2D( _NormalMap, uv_NormalMap );
				#else
				float4 staticSwitch601 = float4( packedInput.ase_normal , 0.0 );
				#endif
				
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.BaseColor = FinalColor345.rgb;
				surfaceDescription.Normal = staticSwitch601.rgb;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _Metallic;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = FinalColor345.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Occlusion = packedInput.ase_normal.x;
				surfaceDescription.Alpha = FinalAlpha346;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.1;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);

            #ifdef DEBUG_DISPLAY
            #ifdef OUTPUT_SPLIT_LIGHTING
				outDiffuseLighting = float4(0, 0, 0, 1);
				ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
			#endif

				bool viewMaterial = false;
				int bufferSize = _DebugViewMaterialArray[0].x;
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = _DebugViewMaterialArray[index].x;

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB && _DebugAOVOutput == 0)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);
						GetPBRValidatorDebug(surfaceData, result);
						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
                #endif
					{
                #ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
                #else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
                #endif
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;

						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

                #ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = float4(0, 0, 0, 1);
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
                #else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
                #endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
                #if defined(HAVE_VFX_MODIFICATION) && !VFX_FEATURE_MOTION_VECTORS
                        forceNoMotion = true;
                #endif
				        if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
				}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
					outVTFeedback = builtinData.vtPackedFeedback;
				#endif

                #ifdef UNITY_VIRTUAL_TEXTURING
				    float vtAlphaValue = builtinData.opacity;
                    #if defined(HAS_REFRACTION) && HAS_REFRACTION
					vtAlphaValue = 1.0f - bsdfData.transmittanceMask;
                #endif
				outVTFeedback = PackVTFeedbackWithAlpha(builtinData.vtPackedFeedback, input.positionSS.xy, vtAlphaValue);
                #endif
			}
			ENDHLSL
		}

		
		Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

            HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 140008


			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_TANGENT_TO_WORLD

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		    #define VARYINGS_NEED_CULLFACE
			#endif
			#endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
			#define WRITE_NORMAL_BUFFER
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			float4 _SelectionID;
            CBUFFER_START( UnityPerMaterial )
			float4 _NormalMap_ST;
			float4 _OffsetPivot;
			float4 _MainColor;
			float4 _ColorTransition;
			float3 _NormalizedRotationAxis;
			float3 _CustomPivotVec;
			float _Push;
			float _SharpTransition;
			float _STEP;
			float _Distortion;
			float _SizeWhenTransition;
			float _Subdivision;
			float _CustomTexture;
			float _DETAILES;
			float _EmissiveFctor;
			float _MainColorMult;
			float _ColorPow;
			float _Desaturation;
			float _Angle;
			float _Exp;
			float _Transition;
			float _ManualTransition;
			float _Tiling;
			float _TransitionFactor;
			float _TilingTransition;
			float _Metallic;
			float _Smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MaskMap;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Pattern;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _INVERSEDIRECTION_ON
			#pragma shader_feature_local _TRANSITIONXVSY_ON
			#pragma shader_feature_local _INVERSEANIMATION_ON
			#pragma shader_feature_local _MANUALAUTOMATIC_ON
			#pragma shader_feature_local _CUSTOMPIVOT_ON


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 tangentWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float MyCustomExpression535( float _Time, float _Period )
			{
				// Calculate a sine wave value that oscillates between 0 and 1 over time
				float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5;
				return v ;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

            struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
			struct SurfaceDescriptionInputs
			{
				float3 ObjectSpaceNormal;
				float3 WorldSpaceNormal;
				float3 TangentSpaceNormal;
				float3 ObjectSpaceViewDirection;
				float3 WorldSpaceViewDirection;
				float3 ObjectSpacePosition;
			};


            void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {

                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif

                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
				float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
				ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);
                #endif

                #ifdef _ALPHATEST_ON
				float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
				alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                #endif
				GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif

                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

                #ifdef FRAG_INPUTS_USE_TEXCOORD1
				float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
				float4 lightmapTexCoord1 = float4(0, 0, 0, 0);
                #endif

                #ifdef FRAG_INPUTS_USE_TEXCOORD2
				float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
				float4 lightmapTexCoord2 = float4(0, 0, 0, 0);
                #endif

				//InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);

                //#else
                //BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

                ZERO_INITIALIZE(SurfaceData, surfaceData);

                ZERO_BUILTIN_INITIALIZE(builtinData);
                builtinData.opacity = surfaceDescription.Alpha;

                #if defined(DEBUG_DISPLAY)
				builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif

                #ifdef _ALPHATEST_ON
				builtinData.alphaClipTreshold = alphaCutoff;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif

                #if _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                #if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif

                #ifndef SHADER_UNLIT
				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
				ApplyDebugToBuiltinData(builtinData);
                #endif

				RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS

            }


			VertexOutput VertexFunction(VertexInput inputMesh  )
			{

				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o );

				float2 texCoord439 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2Dlod( _MaskMap, float4( (texCoord439*_TilingTransition + 0.0), 0, 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2Dlod( _MaskMap, float4( (texCoord39*_Tiling + 0.0), 0, 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_0 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_0 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float lerpResult275 = lerp( 0.0 , ( _Push / 100.0 ) , TransitionMask486);
				#ifdef _INVERSEANIMATION_ON
				float3 staticSwitch455 = ( _NormalizedRotationAxis * -1.0 );
				#else
				float3 staticSwitch455 = _NormalizedRotationAxis;
				#endif
				float MaskMap426 = temp_output_46_0;
				float4 localWorldVar261 = float4( 0,0,0,1 );
				(localWorldVar261).xyz = GetCameraRelativePositionWS((localWorldVar261).xyz);
				float4 transform261 = mul(GetWorldToObjectMatrix(),localWorldVar261);
				float3 objToWorld290 = GetAbsolutePositionWS(mul( GetObjectToWorldMatrix(), float4( transform261.xyz, 1 ) ).xyz);
				float3 clampResult617 = clamp( _CustomPivotVec , float3( -1.5,-1.5,-1.5 ) , float3( 1.5,1.5,1.5 ) );
				#ifdef _CUSTOMPIVOT_ON
				float3 staticSwitch604 = clampResult617;
				#else
				float3 staticSwitch604 = objToWorld290;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float4 staticSwitch452 = ( _OffsetPivot * -1.0 );
				#else
				float4 staticSwitch452 = _OffsetPivot;
				#endif
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 worldToObj289 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(ase_worldPos), 1 ) ).xyz;
				float3 rotatedValue258 = RotateAroundAxis( ( float4( staticSwitch604 , 0.0 ) + ( staticSwitch452 / 100.0 ) ).xyz, worldToObj289, staticSwitch455, ( ( TransitionMask486 * MaskMap426 ) * _Angle ) );
				float3 FinalDisplacement347 = ( ( inputMesh.normalOS * lerpResult275 ) + rotatedValue258 );
				
				o.ase_texcoord2.xyz = ase_worldPos;
				
				o.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  FinalDisplacement347;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				o.positionCS = TransformWorldToHClip(positionRWS);
				o.normalWS.xyz =  normalWS;
				o.tangentWS.xyzw =  tangentWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(	VertexOutput packedInput
						, out float4 outColor : SV_Target0
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS.xyzw, packedInput.normalWS.xyz);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float3 break181 = _WorldSpaceCameraPos;
				float3 appendResult179 = (float3(( break181.x * -1.0 ) , break181.z , break181.y));
				float3 temp_output_182_0 = ( appendResult179 * _Subdivision );
				float3 ase_worldPos = packedInput.ase_texcoord2.xyz;
				float3 break176 = ase_worldPos;
				float3 appendResult177 = (float3(( break176.x * -1.0 ) , break176.z , break176.y));
				float3 temp_output_174_0 = ( appendResult177 * _Subdivision );
				float3 WP265 = temp_output_174_0;
				float3 temp_output_2_0 = ( WP265 * 1.0 );
				float3 normalizeResult11 = normalize( ( temp_output_182_0 - temp_output_2_0 ) );
				float3 temp_output_1_0_g81 = normalizeResult11;
				float3 temp_output_45_0_g81 = temp_output_182_0;
				float dotResult22_g81 = dot( temp_output_1_0_g81 , temp_output_45_0_g81 );
				float3 temp_cast_0 = (0.5).xxx;
				float3 temp_output_2_0_g81 = ( ( ceil( temp_output_2_0 ) / 1.0 ) - temp_cast_0 );
				float dotResult25_g81 = dot( temp_output_1_0_g81 , temp_output_2_0_g81 );
				float3 temp_output_30_0_g81 = ( WP265 - temp_output_45_0_g81 );
				float dotResult28_g81 = dot( temp_output_1_0_g81 , temp_output_30_0_g81 );
				float temp_output_27_0_g81 = ( ( ( dotResult22_g81 - dotResult25_g81 ) * -1.0 ) / dotResult28_g81 );
				float3 normalizeResult27_g82 = normalize( temp_output_1_0_g81 );
				float3 normalizeResult31_g82 = normalize( float3(0,0.00015,-1) );
				float3 normalizeResult29_g82 = normalize( cross( normalizeResult27_g82 , normalizeResult31_g82 ) );
				float3 temp_output_7_0_g81 = ( normalizeResult29_g82 * float3( 1,1,1 ) );
				float3 temp_output_34_0_g81 = ( temp_output_45_0_g81 + ( temp_output_27_0_g81 * temp_output_30_0_g81 ) );
				float3 temp_output_35_0_g81 = ( temp_output_34_0_g81 - temp_output_2_0_g81 );
				float dotResult11_g81 = dot( temp_output_7_0_g81 , temp_output_35_0_g81 );
				float3 normalizeResult10_g81 = normalize( cross( temp_output_7_0_g81 , normalizeResult27_g82 ) );
				float dotResult12_g81 = dot( normalizeResult10_g81 , temp_output_35_0_g81 );
				float2 appendResult14_g81 = (float2(dotResult11_g81 , dotResult12_g81));
				float2 temp_cast_1 = (0.0).xx;
				float2 temp_cast_2 = (0.0).xx;
				float2 ifLocalVar15_g81 = 0;
				if( temp_output_27_0_g81 <= 0.0 )
				ifLocalVar15_g81 = temp_cast_2;
				else
				ifLocalVar15_g81 = appendResult14_g81;
				float2 texCoord439 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord30 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _TRANSITIONXVSY_ON
				float staticSwitch603 = texCoord30.x;
				#else
				float staticSwitch603 = texCoord30.y;
				#endif
				float clampResult438 = clamp( ( ( tex2D( _MaskMap, (texCoord439*_TilingTransition + 0.0) ).r * _TransitionFactor ) + staticSwitch603 ) , 0.0 , 1.0 );
				float2 texCoord39 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_46_0 = ( pow( tex2D( _MaskMap, (texCoord39*_Tiling + 0.0) ).r , 2.0 ) * 0.25 );
				float3 temp_output_32_0 = ( ( 1.0 - ( clampResult438 * float3(1,1,1) ) ) + temp_output_46_0 );
				#ifdef _INVERSEDIRECTION_ON
				float3 staticSwitch469 = ( 1.0 - temp_output_32_0 );
				#else
				float3 staticSwitch469 = temp_output_32_0;
				#endif
				float lerpResult554 = lerp( 0.0 , 3.14 , _ManualTransition);
				float mulTime382 = _TimeParameters.x * _Transition;
				float _Time535 = mulTime382;
				float _Period535 = 2.0;
				float localMyCustomExpression535 = MyCustomExpression535( _Time535 , _Period535 );
				#ifdef _MANUALAUTOMATIC_ON
				float staticSwitch516 = localMyCustomExpression535;
				#else
				float staticSwitch516 = sin( lerpResult554 );
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch449 = ( 1.0 - staticSwitch516 );
				#else
				float staticSwitch449 = staticSwitch516;
				#endif
				#ifdef _INVERSEANIMATION_ON
				float staticSwitch450 = ( _Exp * 2.0 );
				#else
				float staticSwitch450 = _Exp;
				#endif
				float3 temp_cast_3 = (( ( pow( staticSwitch449 , staticSwitch450 ) - 0.5 ) * 2.0 )).xxx;
				float clampResult34 = clamp( (( staticSwitch469 - temp_cast_3 )).z , 0.0 , 1.0 );
				float temp_output_37_0 = ( 1.0 - pow( clampResult34 , 2.0 ) );
				float TransitionMask486 = temp_output_37_0;
				float MaskMap426 = temp_output_46_0;
				float lerpResult425 = lerp( 0.0 , _Distortion , TransitionMask486);
				float2 temp_output_419_0 = ( ( ( ifLocalVar15_g81 / ( ( 1.0 - ( TransitionMask486 * float2( 1,1 ) ) ) * _SizeWhenTransition ) ) + 0.5 ) + ( MaskMap426 * lerpResult425 ) );
				float2 temp_cast_4 = (0.5).xx;
				float lerpResult13 = lerp( 1.0 , 0.0 , TransitionMask486);
				float2 temp_output_7_0_g80 = ( ( temp_output_419_0 - temp_cast_4 ) / lerpResult13 );
				float2 temp_cast_5 = (0.5).xx;
				float dotResult2_g80 = dot( temp_output_7_0_g80 , temp_output_7_0_g80 );
				float lerpResult14 = lerp( 1.0 , 0.1 , TransitionMask486);
				float mulTime482 = _TimeParameters.x * 2.0;
				float cos481 = cos( ( mulTime482 + TransitionMask486 ) );
				float sin481 = sin( ( mulTime482 + TransitionMask486 ) );
				float2 rotator481 = mul( temp_output_419_0 - float2( 0.5,0.5 ) , float2x2( cos481 , -sin481 , sin481 , cos481 )) + float2( 0.5,0.5 );
				float clampResult485 = clamp( ( pow( tex2D( _Pattern, rotator481 ).r , 6.0 ) + 0.1 ) , 0.0 , 1.0 );
				float clampResult480 = clamp( ( clampResult485 - TransitionMask486 ) , 0.0 , 1.0 );
				float temp_output_252_0 = ( 1.0 - (( _CustomTexture )?( ( 1.0 - clampResult480 ) ):( pow( saturate( dotResult2_g80 ) , lerpResult14 ) )) );
				float lerpResult431 = lerp( 1.0 , temp_output_46_0 , temp_output_37_0);
				float lerpResult242 = lerp( lerpResult431 , 0.0 , TransitionMask486);
				float temp_output_241_0 = ( temp_output_252_0 * lerpResult242 );
				float FinalAlpha346 = floor( ceil( temp_output_241_0 ) );
				
				surfaceDescription.Alpha = FinalAlpha346;
				surfaceDescription.AlphaClipThreshold =  0.1;


				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				outColor = _SelectionID;
			}

            ENDHLSL
		}

        Pass
        {

            Name "FullScreenDebug"
            Tags 
			{ 
				"LightMode" = "FullScreenDebug" 
            }

            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

            HLSLPROGRAM

			/*ase_pragma_before*/

			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer

			#pragma vertex Vert
			#pragma fragment Frag


			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
		    #define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if !( (SHADERPASS == SHADERPASS_FORWARD) || (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT) \
               || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT)\
               || (SHADERPASS == SHADERPASS_PATH_TRACING) || (SHADERPASS == SHADERPASS_RAYTRACING_SUB_SURFACE) \
               || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) )

		    #define DISABLE_MODIFY_BAKED_DIFFUSE_LIGHTING
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};

			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}

            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};

			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);

				output.ObjectSpaceNormal =                          input.normalOS;
				output.ObjectSpaceTangent =                         input.tangentOS.xyz;
				output.ObjectSpacePosition =                        input.positionOS;

				return output;
			}

			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);

				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS;

				return output;
			}


			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}


            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
			{
				SurfaceDescriptionInputs output;
				ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

				#if defined(SHADER_STAGE_RAY_TRACING)
				#else
				#endif
				output.TangentSpaceNormal =                         float3(0.0f, 0.0f, 1.0f);
				return output;
			}

			void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
				surfaceData.metallic =                  surfaceDescription.Metallic;

				#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
					if (_EnableSSRefraction)
					{

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif


				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
					surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
				#endif


				GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);


				#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
					}
				#endif

				bentNormalWS = surfaceData.normalWS;

				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#ifdef DEBUG_DISPLAY
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{

						surfaceData.metallic = 0;
					}

					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif
			}

            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {

                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif

                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif

                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);
                #endif

                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);

                #ifdef _ALPHATEST_ON
				float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
				alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                #endif
				GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif

                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

                ZERO_BUILTIN_INITIALIZE(builtinData);
                builtinData.opacity = surfaceDescription.Alpha;

                #if defined(DEBUG_DISPLAY)
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif

                #endif

                #ifdef _ALPHATEST_ON

                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif


                builtinData.emissiveColor = surfaceDescription.Emission;

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif

                #ifndef SHADER_UNLIT

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif

            }

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil]
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}
            ENDHLSL
        }
		
	}
	
	CustomEditor "UltimateDissolveFX_GUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19106
Node;AmplifyShaderEditor.CommentaryNode;353;3627.18,798.48;Inherit;False;1849.36;960.031;Colors;17;492;313;312;345;310;433;432;397;446;447;307;387;511;395;384;394;616;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;351;7049.35,809.4265;Inherit;False;605.0422;559.5523;Outputs;4;350;349;348;588;;0.3057392,0.9245283,0.09303422,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;280;520.7256,273.0792;Inherit;False;1114;667;Displacement;8;274;275;276;277;279;293;294;445;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;273;5.079835,1399.193;Inherit;False;1581.321;1088.194;Comment;17;255;256;257;258;282;264;261;286;290;289;291;292;444;458;459;460;604;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;254;-4869.333,388.0443;Inherit;False;3567.948;870.5713;Mask;32;450;469;19;21;470;449;451;382;383;448;20;304;305;30;32;297;295;296;37;35;36;34;33;29;28;27;515;516;535;539;554;553;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;253;-2623.023,1429.618;Inherit;False;1414.361;665.7555;Comment;8;39;44;45;46;47;240;41;43;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;518;2179.756,-223.2137;Inherit;False;828.1869;614.2216;MatcapUv;4;522;521;520;519;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;27;-3219.362,911.1561;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-2907.156,912.1732;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;29;-2369.188,889.7998;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;33;-2163.762,882.6815;Inherit;False;False;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;34;-1888.167,892.851;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1887.15,1118.614;Inherit;False;Constant;_Float3;Float 3;5;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;35;-1678.674,896.9186;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;37;-1481.385,899.9694;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;277;1132.726,412.0792;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;14;-717.6176,-212.299;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-1143.308,-192.2838;Inherit;False;Constant;_SEnd;SEnd;1;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;13;-717.5836,-499.0809;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;256;498.9415,1520.548;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;275;776.7256,791.0792;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;276;793.1119,410.3069;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;255;172.0425,1519.967;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotateAboutAxisNode;258;1254.14,1499.714;Inherit;False;False;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;293;752.1472,594.3851;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;291;587.3193,2228.126;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;294;578.1472,713.3851;Inherit;False;Constant;_Float7;Float 7;8;0;Create;True;0;0;0;False;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1132.75,-278.4413;Inherit;False;Constant;_SStart;SStart;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1122.636,-473.3851;Inherit;False;Constant;_REnd;REnd;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1113.721,-555.9961;Inherit;False;Constant;_RStart;RStart;1;0;Create;True;0;0;0;False;0;False;1;144;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;296;-3022.79,597.5288;Inherit;False;Constant;_Vector2;Vector 2;8;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;295;-2770.79,517.5289;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;297;-2614.456,518.5273;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;32;-2453.798,516.7134;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;45;-1762.677,1635.618;Inherit;False;Constant;_Float4;Float 4;7;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-1551.421,1697.671;Inherit;False;Constant;_Float5;Float 5;7;0;Create;True;0;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;347;1776.566,407.8797;Inherit;False;FinalDisplacement;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;369;-730.1992,-613.7822;Inherit;False;Constant;_Float12;Float 12;12;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;44;-1594.843,1565.128;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-1371.996,1560.752;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;298;-23.35594,-296.6336;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;242;56.48321,-337.7164;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;426;-1037.795,1554.852;Inherit;False;MaskMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;30;-3073.587,428.4596;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-2573.023,1573.178;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScaleAndOffsetNode;240;-2282.734,1571.694;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;439;-4012.514,-10.48889;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScaleAndOffsetNode;440;-3722.225,-11.9729;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;441;-3971.814,200.7191;Inherit;False;Property;_TilingTransition;TilingTransition;19;0;Create;True;0;0;0;False;0;False;1;3.09;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;437;-3056.993,-4.461912;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;444;988.0624,2193.4;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;286;1009.484,1958.608;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformPositionNode;289;1193.945,1955.113;Inherit;False;World;Object;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;279;1421.726,412.0792;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;445;1379.707,552.0443;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.AbsOpNode;305;-3665.398,455.5951;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;304;-3834.398,435.5951;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;453;284.6338,2585.535;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;459;344.3795,1841.69;Inherit;False;Constant;_Float10;Float 9;25;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;460;478.3795,1765.69;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;458;606.3795,1692.69;Inherit;False;Property;_InverseAnimation;InverseAnimation;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;457;667.7231,1334.204;Inherit;False;Constant;_Float9;Float 9;25;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;456;801.7231,1258.204;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;455;866.7231,1030.204;Inherit;False;Property;_InverseAnimation;InverseAnimation;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;470;-2276.281,545.9377;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;1;-5114.27,-638.3536;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;178;-4692.597,-260.1885;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;176;-4903.596,-397.1885;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleSubtractOpNode;10;-3157.273,-1161.754;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-3715.662,-642.3205;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;265;-4208.872,-647.0384;Inherit;False;WP;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;174;-4447.598,-648.1887;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;177;-4517.598,-396.1885;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;179;-4382.496,-1195.405;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;181;-4770.494,-1196.405;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;182;-4179.531,-1171.205;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;9;-5150.988,-1214.389;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleDivideOpNode;5;-3220.611,-693.4303;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CeilOpNode;4;-3450.685,-692.7392;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-3129.593,-569.0746;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;180;-4559.495,-1059.405;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;355;-4251.426,-467.8108;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;356;-4338.426,-341.8108;Inherit;False;Constant;_Float1;Float 1;10;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;6;-2936.748,-695.6764;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;11;-2984.94,-1159.306;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;266;-2990.246,-1310.611;Inherit;False;265;WP;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;252;410.8967,-524.9412;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;422;-1403.794,-877.6658;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;481;-1338.651,-1653.111;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;490;505.0297,836.1638;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;491;-28.5061,1443.857;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;431;-687.2587,843.1638;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;486;-1259.304,1087.643;Inherit;False;TransitionMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;493;-65.82971,-109.0153;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;495;-946.5613,-347.3707;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;494;-929.4034,-74.44041;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;478;-156.5254,-1486.316;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;480;29.34875,-1487.111;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;477;-798.5254,-1454.316;Inherit;False;Constant;_Float11;Float 11;30;0;Create;True;0;0;0;False;0;False;6;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;404;-651.1353,-1655.003;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;484;-478.8505,-1654.238;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;485;-330.5684,-1653.579;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;405;192.0209,-1490.174;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;483;-1575.651,-1608.111;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-597.4458,-1518.854;Inherit;False;Constant;_Float13;Float 13;30;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;487;-1817.203,-542.3784;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;425;-1545.553,-722.5274;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;419;-1210.533,-954.7063;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;427;-1796.161,-886.1038;Inherit;False;426;MaskMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;482;-1812.651,-1606.111;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;488;-1831.883,-1500.934;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;503;-3281.735,-419.7721;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;504;-3018.735,-411.7721;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;505;-3208.735,-303.7721;Inherit;False;Constant;_Vector0;Vector 0;30;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.OneMinusNode;506;-2853.735,-415.7721;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;509;-2604.591,-414.2883;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;346;2310.702,-514.7877;Inherit;False;FinalAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;281;923.871,-632.1843;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;200;False;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;299;1131.257,-515.6692;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;300;1417.082,-515.9026;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;241;676.5057,-524.498;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;489;-384.483,-1341.055;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;510;-2863.591,-298.2883;Inherit;False;Property;_SizeWhenTransition;SizeWhenTransition;2;0;Create;True;0;0;0;False;0;False;1;1;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;469;-2057.977,493.0377;Inherit;False;Property;_InverseDirection;InverseDirection;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;449;-3809.25,750.8223;Inherit;False;Property;_InverseAnimation;InverseAnimation;6;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;382;-4512.069,752.014;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;383;-4326.348,750.8581;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;448;-4020.25,625.8223;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;520;2602.275,-87.28857;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TransformDirectionNode;521;2368.275,102.0539;Inherit;False;Object;View;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalVertexDataNode;522;2194.756,-80.16858;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;20;-3492.076,903.207;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;451;-3939.25,1167.822;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-4802.333,746.9182;Inherit;False;Property;_Transition;AnimationSpeed;5;0;Create;False;0;0;0;False;0;False;0.88;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;394;4009.466,1467.832;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;384;4356.954,1333.283;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;395;4180.294,1514.73;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;397;4834.856,1135.508;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;433;4475.12,1484.896;Inherit;False;Constant;_Float2;Float 2;19;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;310;5020.119,877.3251;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;312;4602.919,914.9927;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;492;4212.348,842.7131;Inherit;False;486;TransitionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;527;3334.002,-440.868;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;546;4317.757,-369.775;Inherit;False;Property;_ColorMap;Color / Map;25;0;Create;False;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;547;4061.567,-465.8803;Inherit;False;Property;_MapMatCap;Map / MatCap;27;0;Create;False;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;529;3620.143,-671.5726;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;539;-4496.079,580.4504;Inherit;False;Constant;_Float17;Float 17;34;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;535;-4340.026,643.3887;Inherit;False;$// Calculate a sine wave value that oscillates between 0 and 1 over time$float v = (sin(_Time * 2 * 3.14159 / _Period) + 1) * 0.5@$$return v @;1;Create;2;True;_Time;FLOAT;0;In;;Inherit;False;True;_Period;FLOAT;0;In;;Inherit;False;My Custom Expression;True;False;0;;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;553;-4372.846,895.6061;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;515;-4809.414,884.9509;Inherit;False;Property;_ManualTransition;Manual Transition;22;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;554;-4523.846,964.6061;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;3.14;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;511;4285.293,1231.575;Inherit;False;Constant;_Float14;Float 14;31;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;43;-2062.805,1545.696;Inherit;True;Property;_MaskMap2;MaskMap2;12;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;555;-3008.82,1538.854;Inherit;True;Property;_MaskMap;MaskMap;31;0;Create;True;0;0;0;False;0;False;None;acb2657f3ed7d0c468e2a4044a636b2b;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;436;-3447.036,-29.89886;Inherit;True;Property;_TransitionMap;TransitionMap;24;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;549;4049.738,-319.2442;Inherit;False;Property;_MainColor;MainColor;29;0;Create;True;0;0;0;False;0;False;0.1415094,0.1415094,0.1415094,0;0.3333333,0,0,0.3333333;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;530;2987.614,-650.2409;Inherit;False;Property;_ColorPow;Color Pow;26;0;Create;False;0;0;0;False;0;False;1;5;0.25;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;345;5232.628,873.9532;Inherit;False;FinalColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;528;2962.639,-424.661;Inherit;False;Property;_Desaturation;Desaturation;30;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;519;2784.891,-98.79259;Float;False;float2 uv_matcap = normal *0.5 + float2(0.5,0.5)@ float2(0.5,0.5)@$$return uv_matcap@;2;Create;1;True;normal;FLOAT3;0,0,0;In;;Float;False;My Custom Expression;True;False;0;;False;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;435;-2814.193,4.68759;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;438;-2650.652,5.0921;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;292;378.6173,2257.608;Inherit;False;Constant;_Float6;Float 6;8;0;Create;True;0;0;0;False;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;454;47.6338,2573.535;Inherit;False;Constant;_Float8;Float 8;24;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;452;515.6338,2540.535;Inherit;False;Property;_InverseAnimation;InverseAnimation;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;446;4559.823,1127.132;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;307;3668.311,1138.224;Inherit;False;Property;_ColorTransition;ColorTransition;13;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;616;4002.021,1135.917;Inherit;False;Property;_UseMainTexture;UseMainTexture;39;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-2532.323,1784.386;Inherit;False;Property;_Tiling;Tiling;7;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;524;3879.478,-453.584;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;525;3537.774,-433.7516;Float;False;Property;_MainColorMult;MainColorMult;8;0;Create;False;0;0;0;False;0;False;1;6.84;0;24;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;523;3123.29,-134.8277;Inherit;True;Property;_MainColorMap;MainColorMap;4;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;-1;d8cfe409d2fb65842a7151f63c8307c5;6a72ff1481692c34d84392e2883a640c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformPositionNode;606;-494.4173,1702.82;Inherit;False;World;Object;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;617;-376.8364,1951.454;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;-1.5,-1.5,-1.5;False;2;FLOAT3;1.5,1.5,1.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-4002.236,-503.2314;Inherit;False;Constant;_Sub;Sub;9;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;175;-4683.597,-624.1887;Inherit;False;Property;_Subdivision;Subdivision;12;0;Create;True;0;0;0;False;0;False;400;400;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;402;-1002.925,-1682.334;Inherit;True;Property;_Pattern;Pattern;17;0;Create;True;0;0;0;False;0;False;-1;b73f7b35313a28849849078e2ba59c1e;ade06192cd65b31478b0a59910ce24ae;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;475;428.0881,-1048.865;Inherit;False;Property;_CustomTexture;Custom Pattern Shape;1;0;Create;False;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-4180.502,1066.784;Inherit;False;Property;_Exp;Transition Falloff;6;0;Create;False;0;0;0;False;0;False;1;0.8;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;516;-4233.414,883.9509;Inherit;False;Property;_ManualAutomatic;Manual / Automatic;23;0;Create;False;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;450;-3808.25,1065.822;Inherit;False;Property;_InverseAnimation;InverseAnimation;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;603;-2931.759,177.1848;Inherit;False;Property;_TransitionXvsY;Transition Axis : X vs Y;36;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;313;4160.559,925.7646;Inherit;False;Property;_SharpTransition;Transition Softness;14;0;Create;False;0;0;0;False;0;False;0.2;2;0.05;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;432;4625.119,1305.896;Inherit;False;Property;_DETAILES;Outlines (If Possible);16;0;Create;False;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;3732.561,1604.376;Inherit;False;Property;_STEP;(Outlines) Steps;15;0;Create;False;0;0;0;False;0;False;0.3;4;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;423;-1900.468,-701.4294;Inherit;False;Property;_Distortion;Pattern Distortion;18;0;Create;False;0;0;0;False;0;False;0;0;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;442;-3297.453,202.9318;Inherit;False;Property;_TransitionFactor;Transition Strength ;20;0;Create;False;0;0;0;False;0;False;0;-0.077;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;257;186.7833,1693.949;Inherit;False;Property;_Angle;Rotation Angle;11;0;Create;False;0;0;0;False;0;False;8;20.19;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;259;318.687,1035.193;Inherit;False;Property;_NormalizedRotationAxis;Rotation Axis;21;0;Create;False;0;0;0;False;0;False;0.05,0.2,1.1;0.05,0.2,1.1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldToObjectTransfNode;261;70.05881,2052.247;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformPositionNode;290;292.6753,2049.987;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;282;822.9169,1910.576;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector3Node;605;-751.8739,1937.654;Inherit;False;Property;_CustomPivotVec;CustomPivotVec;38;0;Create;False;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch;604;534.8599,1909.121;Inherit;False;Property;_CustomPivot;New Custom Pivot Position;37;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector4Node;264;72.57391,2245.36;Inherit;False;Property;_OffsetPivot;Pivot Offset (Obj Pivot Offset);10;0;Create;False;0;0;0;False;0;False;-16,0,0,1;-2.510567,0.4630182,-2.723376,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;274;570.7256,535.0792;Inherit;False;Property;_Push;Vertices Push Mult;9;0;Create;False;0;0;0;False;0;False;0;-3.78;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;598;6117.19,1089.508;Inherit;True;Property;_NormalMap;Normal Map;33;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;601;6564.288,1066.044;Inherit;False;Property;_UseNormalMap;UseNormalMap;35;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;348;7068.35,855.4174;Inherit;False;345;FinalColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;350;7089.35,1242.418;Inherit;False;347;FinalDisplacement;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;381;-346.9884,-525.4374;Inherit;False;SphereMask;-1;;76;988803ee12caf5f4690caee3c8c4a5bb;0;3;15;FLOAT;0;False;14;FLOAT;0;False;12;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;620;-337.0027,-757.8387;Inherit;False;SphereMsk;-1;;80;d24414f1729d7174c992f3a52f6ecfbf;0;4;9;FLOAT2;0,0;False;10;FLOAT;0;False;4;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;502;-2399.765,-1014.042;Inherit;False;VirtualPlaneProjection;-1;;81;429a6c69c5ef8fc4e842944468f87c2b;0;6;44;FLOAT3;0,0,0;False;45;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;9;FLOAT3;0,0,0;False;18;FLOAT2;1,1;False;4;FLOAT;39;FLOAT3;36;FLOAT3;37;FLOAT2;0
Node;AmplifyShaderEditor.WorldPosInputsNode;626;4604.98,542.4014;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;600;6446.19,988.5081;Inherit;False;Property;_Smoothness;Smoothness;34;0;Create;False;0;0;0;False;0;False;0.2;0.462;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;599;6457.19,906.5081;Inherit;False;Property;_Metallic;Metallic;32;0;Create;True;0;0;0;False;0;False;0.2;0.063;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;447;4218.849,1041.219;Inherit;False;Property;_EmissiveFctor;Emissive Mult;24;0;Create;False;0;0;0;False;0;False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;639;7205.529,673.8284;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;640;7017.529,709.8284;Inherit;False;Constant;_Float15;Float 15;45;0;Create;True;0;0;0;False;0;False;1E-05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;588;7089.846,1054.649;Inherit;False;Constant;_Cutoff;Cutoff;3;0;Create;True;0;0;0;False;0;False;0.1;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;661;7352.587,859.4264;Float;False;True;-1;2;UltimateDissolveFX_GUI;0;12;UltimateDissolveFX_Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;GBuffer;0;0;GBuffer;34;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;True;True;True;True;0;True;_LightLayersMaskBuffer4;False;False;False;False;False;False;False;True;True;0;True;_StencilRefGBuffer;255;False;;255;True;_StencilWriteMaskGBuffer;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;False;True;0;True;_ZTestGBuffer;False;True;1;LightMode=GBuffer;False;False;0;;0;0;Standard;39;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;0;Alpha Clipping;1;638233328427809342;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;0;0;  Energy Conserving Specular;1;0;  Transmission,InvertActionOnDeselection;0;0;Forward Only;0;0;Receive Decals;1;0;Receives SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;1;0;Override Baked GI;0;0;Depth Offset;0;0;DOTS Instancing;0;0;GPU Instancing;1;0;LOD CrossFade;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position;0;638233329690486904;0;11;True;True;True;True;True;True;False;False;False;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;662;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;663;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;664;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;665;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;666;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;667;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentBackface;0;6;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;False;False;True;0;True;_ZWrite;True;0;True;_ZTestTransparent;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;668;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPrepass;0;7;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;669;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPostpass;0;8;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;670;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Forward;0;9;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;True;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;671;7352.587,859.4264;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ScenePickingPass;0;10;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.GetLocalVarNode;349;7089.35,1131.418;Inherit;False;346;FinalAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;602;6348.288,1318.044;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;548;3450.042,397.4372;Inherit;True;Property;_MainMap;MainMap;28;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;-1;d8cfe409d2fb65842a7151f63c8307c5;d8cfe409d2fb65842a7151f63c8307c5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;27;0;20;0
WireConnection;28;0;27;0
WireConnection;29;0;469;0
WireConnection;29;1;28;0
WireConnection;33;0;29;0
WireConnection;34;0;33;0
WireConnection;35;0;34;0
WireConnection;35;1;36;0
WireConnection;37;0;35;0
WireConnection;277;0;276;0
WireConnection;277;1;275;0
WireConnection;14;0;17;0
WireConnection;14;1;18;0
WireConnection;14;2;494;0
WireConnection;13;0;15;0
WireConnection;13;1;16;0
WireConnection;13;2;495;0
WireConnection;256;0;255;0
WireConnection;256;1;257;0
WireConnection;275;1;293;0
WireConnection;275;2;490;0
WireConnection;255;0;491;0
WireConnection;255;1;426;0
WireConnection;258;0;455;0
WireConnection;258;1;256;0
WireConnection;258;2;282;0
WireConnection;258;3;289;0
WireConnection;293;0;274;0
WireConnection;293;1;294;0
WireConnection;291;0;452;0
WireConnection;291;1;292;0
WireConnection;295;0;438;0
WireConnection;295;1;296;0
WireConnection;297;0;295;0
WireConnection;32;0;297;0
WireConnection;32;1;46;0
WireConnection;347;0;279;0
WireConnection;44;0;43;1
WireConnection;44;1;45;0
WireConnection;46;0;44;0
WireConnection;46;1;47;0
WireConnection;298;0;431;0
WireConnection;242;0;298;0
WireConnection;242;2;493;0
WireConnection;426;0;46;0
WireConnection;240;0;39;0
WireConnection;240;1;41;0
WireConnection;440;0;439;0
WireConnection;440;1;441;0
WireConnection;437;0;436;1
WireConnection;437;1;442;0
WireConnection;289;0;286;0
WireConnection;279;0;277;0
WireConnection;279;1;445;0
WireConnection;445;0;258;0
WireConnection;305;0;304;2
WireConnection;453;0;264;0
WireConnection;453;1;454;0
WireConnection;460;0;257;0
WireConnection;460;1;459;0
WireConnection;458;1;257;0
WireConnection;458;0;460;0
WireConnection;456;0;259;0
WireConnection;456;1;457;0
WireConnection;455;1;259;0
WireConnection;455;0;456;0
WireConnection;470;0;32;0
WireConnection;178;0;176;0
WireConnection;176;0;1;0
WireConnection;10;0;182;0
WireConnection;10;1;2;0
WireConnection;2;0;265;0
WireConnection;2;1;132;0
WireConnection;265;0;174;0
WireConnection;174;0;177;0
WireConnection;174;1;175;0
WireConnection;177;0;178;0
WireConnection;177;1;176;2
WireConnection;177;2;176;1
WireConnection;179;0;180;0
WireConnection;179;1;181;2
WireConnection;179;2;181;1
WireConnection;181;0;9;0
WireConnection;182;0;179;0
WireConnection;182;1;175;0
WireConnection;5;0;4;0
WireConnection;5;1;132;0
WireConnection;4;0;2;0
WireConnection;180;0;181;0
WireConnection;355;0;174;0
WireConnection;355;1;356;0
WireConnection;6;0;5;0
WireConnection;6;1;7;0
WireConnection;11;0;10;0
WireConnection;252;0;475;0
WireConnection;422;0;427;0
WireConnection;422;1;425;0
WireConnection;481;0;419;0
WireConnection;481;2;483;0
WireConnection;431;1;46;0
WireConnection;431;2;37;0
WireConnection;486;0;37;0
WireConnection;478;0;485;0
WireConnection;478;1;489;0
WireConnection;480;0;478;0
WireConnection;404;0;402;1
WireConnection;404;1;477;0
WireConnection;484;0;404;0
WireConnection;484;1;501;0
WireConnection;485;0;484;0
WireConnection;405;0;480;0
WireConnection;483;0;482;0
WireConnection;483;1;488;0
WireConnection;425;1;423;0
WireConnection;425;2;487;0
WireConnection;419;0;502;0
WireConnection;419;1;422;0
WireConnection;504;0;503;0
WireConnection;504;1;505;0
WireConnection;506;0;504;0
WireConnection;509;0;506;0
WireConnection;509;1;510;0
WireConnection;346;0;300;0
WireConnection;281;0;241;0
WireConnection;299;0;241;0
WireConnection;300;0;299;0
WireConnection;241;0;252;0
WireConnection;241;1;242;0
WireConnection;469;1;32;0
WireConnection;469;0;470;0
WireConnection;449;1;516;0
WireConnection;449;0;448;0
WireConnection;382;0;19;0
WireConnection;383;0;382;0
WireConnection;448;0;516;0
WireConnection;520;0;521;0
WireConnection;521;0;522;0
WireConnection;20;0;449;0
WireConnection;20;1;450;0
WireConnection;451;0;21;0
WireConnection;394;0;252;0
WireConnection;394;1;387;0
WireConnection;384;0;395;0
WireConnection;395;0;394;0
WireConnection;397;0;446;0
WireConnection;397;1;432;0
WireConnection;310;0;546;0
WireConnection;310;1;397;0
WireConnection;310;2;312;0
WireConnection;312;0;492;0
WireConnection;312;1;313;0
WireConnection;527;0;523;0
WireConnection;527;1;528;0
WireConnection;546;1;547;0
WireConnection;546;0;549;0
WireConnection;547;1;548;0
WireConnection;547;0;524;0
WireConnection;529;0;527;0
WireConnection;529;1;530;0
WireConnection;535;0;382;0
WireConnection;535;1;539;0
WireConnection;553;0;554;0
WireConnection;554;2;515;0
WireConnection;43;0;555;0
WireConnection;43;1;240;0
WireConnection;436;0;555;0
WireConnection;436;1;440;0
WireConnection;345;0;310;0
WireConnection;519;0;520;0
WireConnection;435;0;437;0
WireConnection;435;1;603;0
WireConnection;438;0;435;0
WireConnection;452;1;264;0
WireConnection;452;0;453;0
WireConnection;446;0;616;0
WireConnection;446;1;447;0
WireConnection;446;2;511;0
WireConnection;616;1;307;0
WireConnection;616;0;548;0
WireConnection;524;0;529;0
WireConnection;524;1;525;0
WireConnection;524;2;307;0
WireConnection;523;1;519;0
WireConnection;606;0;605;0
WireConnection;617;0;605;0
WireConnection;402;1;481;0
WireConnection;475;0;620;0
WireConnection;475;1;405;0
WireConnection;516;1;553;0
WireConnection;516;0;535;0
WireConnection;450;1;21;0
WireConnection;450;0;451;0
WireConnection;603;1;30;2
WireConnection;603;0;30;1
WireConnection;432;0;433;0
WireConnection;432;1;384;0
WireConnection;290;0;261;0
WireConnection;282;0;604;0
WireConnection;282;1;291;0
WireConnection;604;1;290;0
WireConnection;604;0;617;0
WireConnection;601;1;602;0
WireConnection;601;0;598;0
WireConnection;381;15;369;0
WireConnection;381;14;13;0
WireConnection;381;12;14;0
WireConnection;620;9;419;0
WireConnection;620;10;369;0
WireConnection;620;4;13;0
WireConnection;620;3;14;0
WireConnection;502;44;266;0
WireConnection;502;45;182;0
WireConnection;502;1;11;0
WireConnection;502;2;6;0
WireConnection;502;18;509;0
WireConnection;639;0;348;0
WireConnection;639;1;640;0
WireConnection;661;0;348;0
WireConnection;661;1;601;0
WireConnection;661;4;599;0
WireConnection;661;6;348;0
WireConnection;661;7;600;0
WireConnection;661;8;602;0
WireConnection;661;9;349;0
WireConnection;661;10;588;0
WireConnection;661;11;350;0
ASEEND*/
//CHKSM=C2F372DAD468B32EA0769574421147A46C08C9CE
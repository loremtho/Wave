using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using StarterAssets;
using UnityEngine.InputSystem;

public class ThirdShooterController : MonoBehaviour
{
    [SerializeField] private LayerMask aimColliderLayerMask = new LayerMask();
    [SerializeField] private Transform debugTransform;
    [SerializeField] private Transform bulletPrefab;
    [SerializeField] private Transform spawnBulletPos;
    private PlayerController theplayerController;
    // Start is called before the first frame update
    void Awake()
    {
        theplayerController = GetComponent<PlayerController>();
    }

    // Update is called once per frame
    void Update()
    {
        MouseRay();
    }

    void MouseRay()
    {
        Vector3 mouseWoridPos = Vector3.zero;
        Vector2 screenCenterPoint = new Vector2(Screen.width / 2f, Screen.height / 2f);
        Ray ray = Camera.main.ScreenPointToRay(screenCenterPoint);
        if(Physics.Raycast(ray, out RaycastHit raycastHit, 999f, aimColliderLayerMask))
        {
            debugTransform.position = raycastHit.point;
            mouseWoridPos = raycastHit.point;
        }

        //if(starterAssetsInputs.shoot)
        if(Input.GetButton("Fire1"))
        {
            Vector3 aimDir = (mouseWoridPos - spawnBulletPos.position).normalized;
            Instantiate(bulletPrefab, spawnBulletPos.position, Quaternion.LookRotation(aimDir, Vector3.up));
            //starterAssetsInputs.shoot = false;
        }
    }
}

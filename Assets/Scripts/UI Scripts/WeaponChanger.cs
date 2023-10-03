using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class WeaponChanger : MonoBehaviour
{
    public PlayerController player;
    public GameObject WeaponSelectionUI;

    public WeaponManager theWM;

    public GunController Gun;
    public AxeController Axe;

    // Start is called before the first frame update
    
    public void GunA()
    {
        Transform playerWeapon = player.transform.FindDeepChild("SciFi Assault");
        if (playerWeapon != null)
        {
            GameObject WeaponObject = playerWeapon.gameObject;
            if (!WeaponObject.activeSelf)
            {
                Gun.GunMounting();
                theWM.SetCurrentWeaponType("Rifle");
                WeaponObject.SetActive(true);
                Debug.Log("SciFi Assault 오브젝트를 활성화했습니다.");
                WeaponSelectionUI.SetActive(false);
                
              
            }
            else
            {
                Debug.Log("SciFi Assault 오브젝트는 이미 활성화되어 있습니다.");
            }
        } 
        else
        {
            Debug.LogError("SciFi Assault 오브젝트를 찾을 수 없습니다.");
        }

    }

    public void AxeA()
    {
        Transform playerWeapon = player.transform.FindDeepChild("Axe");
        if (playerWeapon != null)
        {
            GameObject WeaponObject = playerWeapon.gameObject;
            if (!WeaponObject.activeSelf)
            {
                Axe.AxeMounting();
                theWM.SetCurrentWeaponType("AXE");
                WeaponObject.SetActive(true);
                Debug.Log("Axe 오브젝트를 활성화했습니다.");
                WeaponSelectionUI.SetActive(false);
            }
            else
            {
                Debug.Log("Axe 오브젝트는 이미 활성화되어 있습니다.");
            }
        } 
        else
        {
            Debug.LogError("Axe 오브젝트를 찾을 수 없습니다.");
        }

    }

    
}

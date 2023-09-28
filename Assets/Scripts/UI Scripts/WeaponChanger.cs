using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WeaponChanger : MonoBehaviour
{
    public PlayerController player;
    // Start is called before the first frame update

    public void GunA()
    {
        Transform playerWepon = player.transform.FindDeepChild("SciFi Assault");
        if (playerWepon != null)
        {
            GameObject WeponObject = playerWepon.gameObject;
            if (!WeponObject.activeSelf)
            {
                WeponObject.SetActive(true);
                Debug.Log("SciFi Assault 오브젝트를 활성화했습니다.");
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

    
}

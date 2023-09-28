using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WeaponChanger : MonoBehaviour
{
    public PlayerController player;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void GunA()
    {
        Transform playerAxe = player.transform.FindDeepChild("Axe");
        if (playerAxe != null)
        {
            GameObject AxeObject = playerAxe.gameObject;
            if (!AxeObject.activeSelf)
            {
                AxeObject.SetActive(true);
                Debug.Log("Axe 오브젝트를 활성화했습니다.");
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

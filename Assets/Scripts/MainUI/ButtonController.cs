using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonController : MonoBehaviour
{

    public GameObject ShopUI;

    private WeaponChanger weaponchanger; //무기 변경 스크립트

    public GameObject WeaponSelectionUI;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void inShop()
    {
        ShopUI.SetActive(true);
    }

    public void outShop()
    {
        ShopUI .SetActive(false);

    }

       public void inWeaponSelect()
    {
        WeaponSelectionUI.SetActive(true);
    }

    public void outWeaponSelect()
    {
        WeaponSelectionUI .SetActive(false);

    }

    public void SelectionGun()
    {
        weaponchanger.GunA();
        WeaponSelectionUI.SetActive(false);
    }

       public void SelectionAxe()
    {
         weaponchanger.AxeA();
         WeaponSelectionUI .SetActive(false);

    }
}

{**
* 2007-2019 PrestaShop and Contributors
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to https://www.prestashop.com for more information.
*
* @author PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2019 PrestaShop SA and Contributors
* @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
    <div class="header-top-right-block">
                <div class="hidden-md-up text-sm-center mobile mobile-menu-btn">
                    <div class="menu-icon" id="menu-icon">
                        <i class="material-icons d-inline">&#xE5D2;</i>
                        <span>{l s='Menu' d='Shop.Theme.Actions'}</span>
                    </div>
{*
                    <div class="float-xs-right" id="_mobile_cart"></div>
                    <div class="float-xs-right" id="_mobile_user_info"></div>
                    <div class="top-logo" id="_mobile_logo"></div>
                    <div class="clearfix"></div>
*}
                </div>

        <div id="_desktop_user_info">
            <div class="user-info">
                {if $logged}
                {*
                <a class="logout" href="{$logout_url}" rel="nofollow">
                    <img src="{$urls.theme_assets}svg/account-black.svg" alt="" />
                    <span>{l s='Sign out' d='Shop.Theme.Actions'}</span>
                </a>
                *}
                <a class="account" href="{$my_account_url}" title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
                    <img src="{$urls.theme_assets}svg/account-black.svg" alt="" />
                    <span class="">{* {$customerName} *} {l s='Account' d='Shop.Theme.Actions'}</span>
                </a>
                {else}
                <a href="{$my_account_url}" title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
                    <img src="{$urls.theme_assets}svg/account-black.svg" alt="" />
                    <span class="">{l s='Sign in' d='Shop.Theme.Actions'}</span>
                </a>
                {/if}
            </div>
        </div>

        <div class="contact-link">
            <a href="{url entity='contact'}">
                <img src="{$urls.theme_assets}svg/contact-black.svg" alt="" />
                <span>{l s='Kontakt' d='Shop.Theme.Actions'}</span>
            </a>
        </div>

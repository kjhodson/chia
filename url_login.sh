#!/bin/bash
# https://euro1.ggpool.org/login?launcher_id=61555a844904a1e030014fd53feecc9a3cbe1783f4a42ae88c870ea2ee3d61d0&authentication_token=5535825&signature=a536e3a04df84cad9d6e1f37404b17a2067514ad27aa86e38084eba340d3c26dce3c64eb917902c2df62f2216cee45f91178b664e4f11ef6280d37a27079bdfb23124d8d6eaceffced9699611707298c6b406cbc51c001a8daa36dbd146d96e5

# chia plotnft show | grep Launcher
# chia plotnft get_login_link -l 61555a844904a1e030014fd53feecc9a3cbe1783f4a42ae88c870ea2ee3d61d0

# LAUNCHER=$(chia plotnft show | grep launcher | awk '{print $3}' | sed -n '1p') && chia plotnft get_login_link -l $LAUNCHER
LAUNCHER=`chia plotnft show | grep Launcher | awk '{print $3}' | sed -n '1p'` && chia plotnft get_login_link -l $LAUNCHER


package keeper

import (
	"github.com/ivyxjc/blog/x/blog/types"
)

var _ types.QueryServer = Keeper{}
